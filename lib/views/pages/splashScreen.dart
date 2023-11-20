import 'dart:async';
import 'dart:io';

import 'package:beams_pricecheck/controller/Global/globalValues.dart';
import 'package:beams_pricecheck/views/components/alertDialog.dart';
import 'package:beams_pricecheck/views/pages/itemScan.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_autoupdate/flutter_autoupdate.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_device_identifier/flutter_device_identifier.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:version/version.dart';

import '../../controller/Services/apiController.dart';
import '../../controller/common/common_page.dart';
import '../components/common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var g=Global();
  late Future<dynamic> futureGlobal;
  late Future <dynamic> futureform;
 String lstrDeviceId = '';
 String lstrDeviceName = '';
  var tapedStartBtn = false;
  String appError = "";
  var blUpdate=false;
  UpdateResult? _result;
  DownloadProgress? _download;
  var _startTime = DateTime.now().millisecondsSinceEpoch;
  var _bytesPerSec = 0;
  final TextEditingController txtMainCompany = TextEditingController();
  @override
  void initState() {

    fnPackageInfo();
    fnDefaultPageSettings();
    fnDeviceDetails(context);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff18253d),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  tc("BEAMS ", Colors.white, 35),
                  tc("PRICE CHECKER", Colors.white, 35),
                ],
              ),
            ),
            const Text("Powered By BEAMS",style: TextStyle(fontSize: 10,color: Colors.white),),
            gapHC(6)
          ],
        ),
      ),
    );
  }


  //========================================SYSTEM INFO
  Future fnDeviceDetails(context) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();

      dprint("fnPhoneDetails................");
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      try {
        if (kIsWeb) {
          debugPrint("WEB Platform.... ${lstrDeviceId}");
          WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
          // await prefs.setString(asDeviceId,(lstrDeviceId??webBrowserInfo.userAgent).toString());
          // await prefs.setString(asPhonDevice, webBrowserInfo.userAgent!);
          // await prefs.setString(asPhonmodel, webBrowserInfo.platform!);

            lstrDeviceId = webBrowserInfo.userAgent!;
            lstrDeviceName = webBrowserInfo.browserName.name;



          print('lstrDeviceName.-------------. ${webBrowserInfo.browserName.name}');
          print('lstrDeviceId--------- ${webBrowserInfo.userAgent!}');
        }
        else if (Platform.isAndroid) {
          debugPrint("ANDROID............");
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          dprint('ANDROID device ${androidInfo.device}');
          await fnInitPlatformState();
          // lstrDeviceId.value = androidInfo.id;
          //await initUniqueIdentifierState();
          lstrDeviceName = androidInfo.model;
          dprint('ANDROID model ${androidInfo.model}');
          dprint('ANDROID product ${androidInfo.product}');
          dprint('ANDROID manufacturer ${androidInfo.manufacturer}');
          // await prefs.setString(asPhonmodel, androidInfo.model);
          // await prefs.setString(asDeviceId, lstrDeviceId);
          // await prefs.setString(asPhonProduct, androidInfo.product);
        }
        else if (Platform.isIOS) {
          IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
          lstrDeviceId = iosInfo.identifierForVendor!;
          lstrDeviceName = iosInfo.utsname.machine!;
          // await prefs.setString(asPhonmodel, iosInfo.model);
          // await prefs.setString(asDeviceId, iosInfo.identifierForVendor!);
          // await prefs.setString(asPhonProduct, iosInfo.utsname.machine);
        }
        else if (Platform.isWindows) {
          dprint("WINDOWS>>>>>>>>>>>>>>>>>>");
          WindowsDeviceInfo windowsDeviceInfo = await deviceInfo.windowsInfo;
          dprint('WINDOWS ID ${lstrDeviceId}');
          final windowsInfo = await deviceInfo.windowsInfo;

          dprint('WINDOWS deviceId ${windowsDeviceInfo.deviceId}');
          dprint('WINDOWS computerName ${windowsDeviceInfo.computerName}');
          lstrDeviceId = windowsInfo.deviceId;
          lstrDeviceName = windowsInfo.computerName;
          // await Prefs.setString(asPhonmodel, windowsDeviceInfo.computerName??"");
          // await prefs.setString(asDeviceId, windowsDeviceInfo.deviceId??"");
          // await Prefs.setString(asPhonProduct, windowsDeviceInfo.productId??"");
        }
      } on PlatformException {
        lstrDeviceId = 'Failed to get deviceId.';
        dprint("PLATFROM EXCEPTIONS_____________");
      }
       setState(() {
         g.wstrDeivceId = lstrDeviceId.toString();
         g.wstrDeviceName = lstrDeviceName.toString();
         dprint("DEVICE__ID>>>> ${lstrDeviceId.toString()}");
         dprint("DEVICE__Name>>>> ${lstrDeviceName.toString()}");
       });
      gapiCheckDevice(context,lstrDeviceId.toString());


  }
  Future<void> fnInitPlatformState() async {


  String platformVersion;

  try {
    platformVersion = await FlutterDeviceIdentifier.platformVersion ??
        'Unknown platform version';
  } on PlatformException {
    platformVersion = 'Failed to get platform version.';
  }

  dprint('Platform Version => $platformVersion');

  await FlutterDeviceIdentifier.requestPermission();

    lstrDeviceId = await FlutterDeviceIdentifier.androidID;
    dprint("######################id>>> ${lstrDeviceId}");




 }

  void fnPackageInfo()async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    g.wstrVersionName = packageInfo.version;
  }
  fnDefaultPageSettings() async{

    g.wstrAppID = "TPR";

    dprint("VERSION___________NAME  ${ g.wstrVersionName}");
    dprint("APP___ID :  ${ g.wstrAppID}");


  }
 //=======================================================FUNCTION
  fnRegisterScreen(context){
    // PageDialog().registerDialog(context, Container(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       lblappError?  tcn(appError, Colors.red, 12):gapHC(0),
    //       tcn('APP ID : ${g.wstrAppID}', Colors.black, 12),
    //       tcn('Device ID : ${g.wstrDeivceId}', Colors.black, 12),
    //       gapHC(10),
    //       Container(
    //         height: 40,
    //         padding: const EdgeInsets.symmetric(horizontal: 15),
    //         decoration: boxOutlineCustom1(Colors.white, 10, Colors.grey, 0.5),
    //         child: TextFormField(
    //           controller: txtMainCompany,
    //           decoration: const InputDecoration(
    //             hintText: 'Main Company',
    //             border: InputBorder.none,
    //           ),
    //         ),
    //       ),
    //       gapHC(15),
    //       GestureDetector(
    //         onTap: (){
    //           gApiRegister(context);
    //         },
    //         child: Container(
    //           decoration: boxDecoration(Colors.green, 10),
    //           padding: const EdgeInsets.all(10),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               tcn('Register', Colors.white, 15)
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // ));

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return StatefulBuilder(builder: (context,StateSetter setState){
          return AlertDialog(
              backgroundColor: Colors.transparent,
              content: Container(
                  width: 350,
                  height: 300,
                  decoration: boxDecoration(Colors.white, 10),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          th('Register', Colors.black, 14),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.highlight_remove_sharp,
                                color: Colors.black,
                                size: 30,
                              ))
                        ],
                      ),
                      gapHC(5),
                      Expanded(
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            tcn(appError??"", Colors.red, 12),
                            tcn('APP ID : ${g.wstrAppID}', Colors.black, 12),
                            tcn('Device ID : ${g.wstrDeivceId}', Colors.black, 12),
                            gapHC(10),
                            Container(
                              // height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              decoration: boxOutlineCustom1(Colors.white, 10, Colors.grey, 0.5),
                              child: TextFormField(
                                controller: txtMainCompany,
                                decoration: const InputDecoration(
                                  hintText: 'Main Company',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            gapHC(15),
                            GestureDetector(
                              onTap: (){

                                  gApiRegister(context,setState);




                              },
                              child: Container(
                                decoration: boxDecoration(Colors.green, 10),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    tcn('Register', Colors.white, 15)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )));
        });
      },
    );

  }
  fnRegisterDone(value,context) async{

    blUpdate=false;

    try{

      dprint("cvalll>>> ${value}");
      g.wstrVersionDetails = value;
      g.wstrMainCompany = (value[0]["MAIN_COMPANY"]??"").toString();
      // g.wstrBaseUrl = "http://192.168.0.105:2201";
      g.wstrBaseUrl = (value[0]["API_URL"]??"").toString();
      g.wstrAppID = (value[0]["APP_ID"]??"").toString();
      g.wstrCompany = (value[0]["COMPANY"]??"").toString();
      g.wstrYearcode = (value[0]["YEARCODE"]??"").toString();
      dprint("VERSIONDETAILS________ ${g.wstrVersionDetails}");
      dprint("  g.wstrVersionName________ ${  g.wstrVersionName}");
      var platform = Platform.isAndroid?"ANDROID":Platform.isWindows?"WINDOWS":Platform.isIOS?"IOS":Platform.isMacOS?"MACOS":"";
      if(Version.parse(g.wstrVersionDetails[0]["VERSION_CODE"])>Version.parse(g.wstrVersionName) &&  g.wstrVersionDetails[0]["PLATFORM"]==platform){
        if(g.wstrVersionDetails[0]["MANDATORY_YN"]=="Y"){
          if(g.wstrVersionDetails[0]["AUTO_UPDATE_YN"]=="Y"){
            //Automatically Update
            fnCheckUpdate();



          }
          else if(g.wstrVersionDetails[0]["AUTO_UPDATE_YN"]!="Y"){
            //Mandatory Update__POP_UP()
            showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                Size size = MediaQuery.of(context).size;
                return AlertDialog(
                    backgroundColor: Colors.transparent,
                    content:StatefulBuilder(
                      builder:(context,setState){
                        return  Container(
                            width: 400,
                            height: size.height*0.3,
                            decoration: boxDecoration(Colors.white, 10),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    th("Mandatory Update",Colors.black,13),
                                    IconButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, icon: const Icon(Icons.highlight_remove_sharp,color: Colors.black,size: 30,))
                                  ],
                                ),
                                gapHC(5),
                                Expanded(
                                  child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          tc( g.wstrVersionDetails[0]["UPDATE_TITLE"]??"", Colors.black54, 12),
                                          const Row(),
                                          tcn("Version  ${g.wstrVersionDetails[0]["VERSION_CODE"]??""}", Colors.black54, 12),
                                          gapHC(2),
                                          tcn(setDate(6, DateTime.parse(g.wstrVersionDetails[0]["PUBLISH_DATE"], )),Colors.black, 12) ,
                                          gapHC(5),
                                          tc("Release Note", Colors.black, 10),
                                          tcn((g.wstrVersionDetails[0]["UPDATE_NOTE"]??"").toString(), Colors.black, 12),

                                        ],
                                      )
                                  ),
                                ),
                                gapHC(5),
                                blUpdate?
                                Column(
                                  children: [
                                    _download!=null ? tc("Progress: ${_download!.progress.toInt()}%", Colors.black, 12):gapHC(0),
                                    gapHC(3),
                                    _download!=null ? tc("Speed: ${_download!.toPrettyMB(_bytesPerSec)}/s", Colors.black, 12):gapHC(0),


                                  ],
                                ):  Bounce(
                                  onPressed: (){
                                    Get.back();
                                    fnCheckUpdate();

                                  },
                                  duration: const Duration(milliseconds: 110),
                                  child: Container(
                                    decoration: boxDecoration(Colors.green, 30),
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.download,color: Colors.white,size: 15,),
                                        gapWC(5),
                                        tcn('Update', Colors.white, 15)
                                      ],
                                    ),
                                  ),
                                )


                              ],
                            )

                        );
                      } ,
                    )
                );
              },
            );

          }

        }
        else{
          //NEW VERSION AVAILBLE POPUP
          showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              Size size = MediaQuery.of(context).size;
              return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  content: StatefulBuilder(
                    builder: (context,setState){
                      return Container(
                          width: 400,
                          height: size.height*0.5,
                          decoration: boxDecoration(Colors.white, 10),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: (){
                                        Get.back();

                                        fnLoadApp();
                                      }, icon: const Icon(Icons.highlight_remove_sharp,color: Colors.black,size: 30,))
                                ],
                              ),
                              th((g.wstrVersionDetails[0]["UPDATE_TITLE"]??"").toString(),Colors.black,13),
                              gapHC(5),
                              Expanded(
                                child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Row(),
                                        tcn("Version  ${g.wstrVersionDetails[0]["VERSION_CODE"]??""}", Colors.black54, 12),
                                        gapHC(2),
                                        tcn(setDate(6, DateTime.parse(g.wstrVersionDetails[0]["PUBLISH_DATE"], )),Colors.black, 12) ,
                                        gapHC(5),
                                        tc("Release Note", Colors.black, 10),
                                        tcn((g.wstrVersionDetails[0]["UPDATE_NOTE"]??"").toString(), Colors.black, 12),
                                      ],
                                    )
                                ),
                              ),

                              gapHC(5),

                              blUpdate?
                              Column(
                                children: [
                                  _download!=null ? tc("Progress: ${_download!.progress.toInt()}%", Colors.black, 12):gapHC(0),
                                  gapHC(3),
                                  _download!=null ? tc("Speed: ${_download!.toPrettyMB(_bytesPerSec)}/s", Colors.black, 12):gapHC(0),


                                ],
                              )
                                  : Bounce(
                                onPressed: (){
                                  fnCheckUpdate();
                                  Get.back();
                                },
                                duration: const Duration(milliseconds: 110),
                                child: Container(
                                  decoration: boxDecoration(Colors.green, 30),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.download,color: Colors.white,size: 15,),
                                      gapWC(5),
                                      tcn('Update', Colors.white, 15)
                                    ],
                                  ),
                                ),
                              ),
                              gapHC(12),
                              SizedBox(
                                child: Bounce(
                                    duration: const Duration(milliseconds: 110),
                                    onPressed: (){
                                      Get.back();
                                      fnLoadApp();

                                    },
                                    child: tc("Not Now", Colors.black, 12)),
                              )


                            ],
                          )

                      );
                    },
                  )
              );
            },



          );
        }
      }
      else{
        dprint("#######################dgdf");
        // fnLoadApp();


        Get.offAll(()=>const ItemScanScreen());
      }
    }catch(e){
      dprint("#############sdfgsf##########dgdf");
      //ApiCall().apiUpdateDevice();
      Get.offAll(()=>const ItemScanScreen());
      // fnLoadApp();

    }





  }
  fnRegisterMessage(context,msg){
    errorMsg(context, msg);
  }

  Future<void> fnCheckUpdate() async {
    UpdateResult? result;

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    // if (!mounted) return;

    if (Platform.isAndroid || Platform.isIOS) {
      var status = await Permission.storage.status;
      if (status.isDenied) {
        await Permission.storage.request();
      }
    }

    var versionUrl;
    if (Platform.isAndroid) {
      versionUrl =g.wstrVersionDetails[0]["UPDATE_URL"];
    } else if (Platform.isWindows) {
      versionUrl =g.wstrVersionDetails[0]["UPDATE_URL"];
    }

    /// Android/Windows
    var manager = UpdateManager(versionUrl: versionUrl);
    /// iOS
    // var manager = UpdateManager(appId: 1500009417, countryCode: 'my');
    try {
      result = await manager.fetchUpdates();

      _result = result;

      fnUpdate();
    } on Exception catch (e) {
      print(e);
    }
  }

  fnUpdate()async{
    // PageDialog().fnShow();
    PageDialog().fnShowAppUpdatingAlert();
    //  PageDialog().show(context,    Column(
    //    children: [
    //      _download!=null ? tc("Progress: ${_download!.progress.toInt()}%", Colors.black, 12):gapHC(0),
    //      gapHC(3),
    //      _download!=null ? tc("Speed: ${_download!.toPrettyMB(_bytesPerSec)}/s", Colors.black, 12):gapHC(0),
    //    ],
    //  ), "Upadte");
    dprint("update..............");
    try {
      var controller = await _result?.initializeUpdate();
      controller?.stream.listen((event) async {

        _download = event;
        if (DateTime.now().millisecondsSinceEpoch - _startTime >= 1000) {
          setState(() {
            _startTime = DateTime.now().millisecondsSinceEpoch;
            _bytesPerSec = event.receivedBytes - _bytesPerSec;
          });

        }

        if (event.completed) {
          print("Downloaded completed");
          Get.back();
          await controller.close();
          await _result?.runUpdate(event.path, autoExit: true);
        }
      });
    } on Exception catch (e) {
      dprint("catchee ${e}");
      print(e);
    }
  }

  fnLoadApp(){
    var duration = const Duration(seconds: 1);
    return Timer(duration, route);
  }
  route() async{
    Get.offAll(()=>const ItemScanScreen());
  }
 //====================================================API
  gapiCheckDevice(context,deviceId){
    dprint("VersioNname>>>>>>>>>>>>> ${g.wstrVersionName}");
    futureGlobal = ApiCall().gapiCheckRegister(deviceId);
    futureGlobal.then((value) => gapiCheckDeviceRes(value,context));
  }


  gapiCheckDeviceRes(value,context){
  setState(() {
    tapedStartBtn = false;
    //[{STATUS: 0, MESSAGE: DEVICE NOT REGISTERED}]
    dprint("ddRRWEWdASDddddddd  ${value.toString()}");
    if(g.fnValCheck(value)){
      var sts =  (value[0]["STATUS"]??"").toString();
      var msg =  (value[0]["MESSAGE"]??"").toString();
      if(sts == "1"){
        fnRegisterDone(value,context);
      }else if(sts=="2"){
        fnRegisterMessage(context,msg);
      }
      else{


        fnRegisterScreen(context);
      }
    }else{
      //MESSAGE

      fnRegisterScreen(context);
    }
  });

  }
  gApiRegister(context,StateSetter setState){
    futureGlobal = ApiCall().gapiDeviceRegister(g.wstrDeivceId.toString(),g.wstrAppID.toString(), g.wstrDeviceName.toString(),txtMainCompany.text);
    futureGlobal.then((value) => gApiRegisterRes(value,context,setState));
  }
  gApiRegisterRes(value,context,setState){
    dprint("VVVALUE>>> ${value}");

    //{MAIN_COMPANY: 0BMS0000000, APP_ID: ESS, API_URL: http://laptop-vi4dgus9:1110/, COMPANY: 01, YEARCODE: 2023, MULTIPLE_COMPANY_YN: N, STATUS: 1, NOTE: TEST}
    setState(() {
      if(g.fnValCheck(value)){
        var status =  (value[0]["STATUS"]??"").toString();
        if(status == "1"){
          Get.back();
          fnRegisterDone(value,context);
        }else{
          appError = "Invalid MainCompany";
        }
      }else{


        appError = "Invalid MainCompany";

        dprint("!!!1>>> ${appError}");


      }
    });
  }


}
