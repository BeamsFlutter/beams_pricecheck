
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:beams_pricecheck/controller/Global/globalValues.dart';
import 'package:beams_pricecheck/controller/Services/appExceptions.dart';
import 'package:beams_pricecheck/controller/common/common_page.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';


class ApiManager {
  var g= Global();

  var baseUrl = Global().wstrBaseUrl; //LAP----------------------------------------
  var mainBaseUrl = "http://beamsdts-001-site1.atempurl.com/api/"; //Test

  var company = Global().wstrCompany;
  var userCd = (Global().wstrUserCd??"").toString();
  var yearcode = Global().wstrYearcode;
  var token = Global().wstrToken;
  var wstrConnection =  Global().wstrConnection;

  var CONTEXT = Global().Context_;

  Future<dynamic> get(String api) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.get(uri);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  //POST
  //===============================================post Global //25-jul-23
  // Future<dynamic> postGlobal(String api, dynamic body) async {
  //   dprint("COMPANY IN POSTGLOBAL>>> ${company}");
  //   dprint("COMPANY IN yearcode>>> ${yearcode}");
  //   dprint("COMPANY IN token>>> ${token}");
  //
  //   var uri = Uri.parse(mainBaseUrl + api);
  //   dprint(uri);
  //   var payload = body;
  //   dprint("PAYLOAD>>>>>>>>>>>>> ${payload}");
  //   try {
  //     var response = await http.post(uri,
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'COMPANY' : company,
  //           'YEARCODE' : yearcode,
  //           'TOKEN':  '$token'
  //         },
  //         body: payload);
  //     return _processResponse(response);
  //   } on SocketException {
  //
  //     throw FetchDataException('No Internet connection', uri.toString());
  //   } on TimeoutException {
  //     throw ApiNotRespondingException('API not responded in time', uri.toString());
  //   }
  // }

  Future<dynamic> postGlobal(String api, dynamic body) async {

    var uri = Uri.parse(mainBaseUrl + api);
    dprint(uri);
    var payload = body;
    try {
      var response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'COMPANY' : g.wstrCompany,
            'YEARCODE' : g.wstrYearcode,
            'TOKEN': g.wstrToken
          },
          body: payload);
      return _processResponse(response);
    } on SocketException {

      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }
  //===============================================END post Global //25-jul-23

  Future<dynamic> post(String api, dynamic body) async {

    var uri = Uri.parse(baseUrl + api);
    var payload = body;
    try {
      var response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'COMPANY' : company,
            'YEARCODE' : yearcode,
            'USERCD' : userCd,
            'DataSession' : "",
            'Authorization': 'Bearer $token'
          },
          body: payload);


      return _processResponse(response);
    } on SocketException {

      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {

      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }
  Future<dynamic> post_ctxt(String api, dynamic body,var isLoad) async {

    if(isLoad =='S'){
      fnShow(CONTEXT,"1");
    }

    var uri = Uri.parse(baseUrl + api);
    var payload = body;
    print(api);
    print(body);
    try {
      var response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'COMPANY' : company,
            'YEARCODE' : yearcode,
            'USERCD' : userCd,
            'DataSession' : "",
            'Authorization': 'Bearer $token'
          },
          body: payload);

      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      print(response);
      return _processResponse(response);
    } on SocketException {
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }

  }
  Future<dynamic> postLink(String api,var isLoad) async {

    var uri = Uri.parse(baseUrl + api);
    if(isLoad =='S'){
      fnShow(CONTEXT,"1");
    }

    try {
      var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'COMPANY' : company,
          'YEARCODE' : yearcode,
          'USERCD' : userCd,
          'DataSession' : "",
          'Authorization': 'Bearer $token'
        },);
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      return _processResponse(response);
    } on SocketException {
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  Future<dynamic> postLoading(String api, dynamic body,var isLoad) async {

    if(isLoad =='S'){
      fnShow(CONTEXT,"1");
    }
    print(api);
    print(body);
    var uri = Uri.parse(baseUrl + api);
    var payload = body;
    try {
      var response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'COMPANY' : company,
            'YEARCODE' : yearcode,
            'USERCD' : userCd,
            'Authorization': 'Bearer $token'
          },
          body: payload);
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      print(response);
      return _processResponse(response);
    } on SocketException {
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }

  }



  Future<dynamic> mfnAttachment(List filesArray,docno,doctype,yearcode,filedescp,user,machine) async {

    var uri = Uri.parse(baseUrl + 'api/UploadFiles');
    http.MultipartRequest request = new http.MultipartRequest('POST', uri);
    request.headers.addAll({ 'Content-Type': 'application/json; charset=UTF-8',
      'COMPANY' : company,
      'YEARCODE' : yearcode,
      'DataSession' : "",
      'Authorization': 'Bearer $token'});

    //multipartFile = new http.MultipartFile("imagefile", stream, length, filename: basename(imageFile.path));
    //List<MultipartFile> newList ;
    request.fields['DOCNO'] = docno;
    request.fields['DOCTYPE'] = doctype;
    request.fields['YEARCODE'] = yearcode;
    request.fields['COMPANY'] = company;
    request.fields['USERCODE'] = user;
    request.fields['MACHINENAME'] = machine;
    var fileDescpStr ='';
    for (int i = 0; i < filesArray.length; i++) {
      File imageFile = filesArray[i];
      fileDescpStr = fileDescpStr+"{'SRNO':"+i.toString()+",'FILE_DESCP':'"+imageFile.path.toString()+"'},";

    }
    fileDescpStr= "["+fileDescpStr+"]";

    for (int i = 0; i < filesArray.length; i++) {
      File imageFile = filesArray[i];
      var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile("imagefile", stream, length,
          filename: basename(imageFile.path));
      request.files.add(multipartFile);
    }

    request.fields['FILE_DESCP'] = fileDescpStr.toString();


    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }



  Future<dynamic> mfnGetToken() async{

    Map<String, dynamic> body = {
      'userName': 'user@beamserp.com',
      'Password': '123456',
      'grant_type': 'password'
    };
    var uri = Uri.parse(baseUrl+'/token');
    try {
      var response = await http.post(
          uri,
          headers: <String, String>{
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
            "Access-Control-Allow-Origin": "*", // Required for CORS support to work
            "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
            "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS"
          },
          body: body,
          encoding: Encoding.getByName("utf-8")
      );
      return _processResponse(response);
    } on SocketException {

      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }

  }
  Future<dynamic> mfnGetCompany(isLoad) async {
    if(isLoad =='S'){
      fnShow(CONTEXT,"1");
    }

    var uri = Uri.parse(baseUrl + 'api/Company');

    try {
      var response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      return _processResponse(response);
    } on SocketException {
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }
  Future<dynamic> mfnGetYearcode(companyCode,isLoad) async {

    if(isLoad =='S'){
      fnShow(CONTEXT,"1");
    }

    var uri = Uri.parse(baseUrl + 'api/Yearcode?Company='+companyCode);
    try {
      var response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      return _processResponse(response);
    } on SocketException {
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      if(isLoad =='S'){
        closeAlert(CONTEXT);
      }
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }
  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 403:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
        throw ServerError(utf8.decode(response.bodyBytes), response.request!.url.toString());
      default:
        throw FetchDataException(' ${response.statusCode}', response.request!.url.toString());
    }
  }

}