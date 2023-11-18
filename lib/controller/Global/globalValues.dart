
import 'dart:convert';
import 'package:beams_pricecheck/controller/Services/apiController.dart';
import 'package:intl/intl.dart';

class Global {

  static final Global _instance = Global._internal();

  // passes the instantiation to the _instance object
  factory Global() => _instance;

  //initialize variables in here
  Global._internal() {
    _wstrCompany = '';
    _wstrCompanyName = '';
    _wstrYearcode = '';
    _wstrUserCd = '';
    _wstrUserName = '';
    _wstrToken = '';
    _wstrDeivceId= '';
    _wstrDeviceName = '';
    _wstrConnection = '';
    _wstrCompanyPara = [];
    _wstrSelectedItems = [];
    _wstrAssignDocno = '';
    _wstrAssignMode = '';
    _wstrTaxIncld = '';
    _wstrSman= '';
    _wstrLowestPriceLevel = '';
    _wstrLowestPriceWarn = '';
    _wstrMdoc= '';
    _wstrBaseUrl = '';
    _wstrAppMode = '';
    _wstrBrnCode= '';
    _wstrVersionName= '';
    _wstrVersionDetails=[];
    _wstrBrnDescp= '';
    _wstrUserPermission  = [];
    _wstrUserDashPerm  = [];
    _wstrUserRepoPerm  = [];
    _wstrUserTranPerm  = [];
    _wstrUserLevel= '';
  }
  var _wstrToken  = '';
  var _wstrCompany = '';
  var _wstrCompanyName = '';
  var _wstrDeivceId = '';
  var _wstrDeviceName = '';
  var _wstrYearcode = '';
  var _wstrUserCd = '';
  var _wstrUserName = '';
  var _wstrConnection = '';
  var _wstrAssignDocno  = '';
  var _wstrAssignMode  = '';
  var _wstrTaxIncld = '';
  var _wstrCompanyPara = [];
  var _wstrSelectedItems = [];
  var _wstrSman = '';
  late Future<dynamic> futureNextDocno;
  var _wstrLowestPriceLevel = '';
  var _wstrLowestPriceWarn = '';
  var _wstrMdoc  = '';
  var _wstrBaseUrl = '';
  var _wstrFingerPrint = '';
  var _wstrAppMode = '';
  var _wstrBrnCode= '';
  var _wstrBrnDescp= '';

  var _wstrUserLevel= '';
  var _wstrVersionName= '';


  //GLOBAL REG
  var _wstrVersionDetails=[];
  var  _wstrMainCompany = "";
  var _wstrAppID = "";
  var _wstrUserPermission  = [];
  var _wstrUserDashPerm  = [];
  var _wstrUserRepoPerm  = [];
  var _wstrUserTranPerm  = [];

  get wstrUserLevel => _wstrUserLevel;

  set wstrUserLevel(value) {
    _wstrUserLevel = value;
  }

  get wstrUserPermission => _wstrUserPermission;

  set wstrUserPermission(value) {
    _wstrUserPermission = value;
  }

  get wstrBrnDescp => _wstrBrnDescp;

  set wstrBrnDescp(value) {
    _wstrBrnDescp = value;
  }

  get wstrBrnCode => _wstrBrnCode;

  set wstrBrnCode(value) {
    _wstrBrnCode = value;
  }

  get wstrAppMode => _wstrAppMode;

  set wstrAppMode(value) {
    _wstrAppMode = value;
  }

  get wstrFingerPrint => _wstrFingerPrint;

  set wstrFingerPrint(value) {
    _wstrFingerPrint = value;
  }

  get wstrBaseUrl => _wstrBaseUrl;

  set wstrBaseUrl(value) {
    _wstrBaseUrl = value;
  }

  get wstrMdoc => _wstrMdoc;

  set wstrMdoc(value) {
    _wstrMdoc = value;
  }

  var _context ;

  get wstrLowestPriceLevel => _wstrLowestPriceLevel;

  set wstrLowestPriceLevel(value) {
    _wstrLowestPriceLevel = value;
  }

  get wstrSman => _wstrSman;

  set wstrSman(value) {
    _wstrSman = value;
  }

  get wstrTaxIncld => _wstrTaxIncld;

  set wstrTaxIncld(value) {
    _wstrTaxIncld = value;
  }

  get wstrSelectedItems => _wstrSelectedItems;

  set wstrSelectedItems(value) {
    _wstrSelectedItems = value;
  }

  get wstrAssignDocno => _wstrAssignDocno;

  set wstrAssignDocno(value) {
    _wstrAssignDocno = value;
  }

  get wstrCompanyPara => _wstrCompanyPara;

  set wstrCompanyPara(value) {
    _wstrCompanyPara = value;
  }

  get wstrConnection => _wstrConnection;

  set wstrConnection(value) {
    _wstrConnection = value;
  }

  get wstrCompanyName => _wstrCompanyName;

  set wstrCompanyName(value) {
    _wstrCompanyName = value;
  }

  get wstrToken => _wstrToken;

  set wstrToken(value) {
    _wstrToken = value;
  }

  get wstrDeivceId => _wstrDeivceId;


  set wstrDeivceId(value) {
    _wstrDeivceId = value;
  }
  get wstrAppID => _wstrAppID;
  set wstrAppID(value) {
    _wstrAppID = value;
  }

  get wstrVersionDetails => _wstrVersionDetails;
  set wstrVersionDetails(value) {
    _wstrVersionDetails = value;
  }
  get wstrMainCompany => _wstrMainCompany;
  set wstrMainCompany(value) {
    _wstrMainCompany = value;
  }

  get wstrVersionName => _wstrVersionName;

  set wstrVersionName(value) {
    _wstrVersionName = value;
  }

  get wstrDeviceName => _wstrDeviceName;


  set wstrDeviceName(value) {
    _wstrDeviceName = value;
  }

  set wstrUserName(value) {
    _wstrUserName = value;
  }

  set wstrUserCd(value) {
    _wstrUserCd = value;
  }

  set wstrYearcode(value) {
    _wstrYearcode = value;
  }

  set wstrCompany(value) {
    _wstrCompany = value;
  }

  get wstrCompany => _wstrCompany;

  get wstrYearcode => _wstrYearcode;

  get wstrUserCd => _wstrUserCd;

  get wstrUserName => _wstrUserName;

  set Context_(ctx){
    _context = ctx;
  }

  get Context_ => _context;


  bool fnValCheck(value){
    if(value == null){
      return false;
    }else{
      if(value.length > 0){
        return true;
      }else{
        return false;
      }
    }
  }

  mfnDbl(dbl){
    var lstrDbl = 0.0;

    try {
      lstrDbl =  double.parse((dbl??'0.0').toString());
    }
    catch(e){
      lstrDbl= 0.00;
    }
    return lstrDbl;
  }

  fnGrep(array,code,value){
    if(array == null){

    }else{
      if(array.length > 0){

      }else{
      }
    }
  }

  mfnNextDocno(doctype){
    futureNextDocno = ApiCall().nextDocno(doctype,'');
    futureNextDocno.then((value) => () {
      return value;
    });
  }

  mfnLookupFocus(txtController,fnCall){
    if(txtController != null){
      if(txtController.text.isNotEmpty){
      //  fnCall;
      }
    }
  }

  mfnJson(arr){
    var tempArray =[];
    if(fnValCheck(arr)){
      String tempString = jsonEncode(arr);
      tempArray  =  jsonDecode(tempString);
    }
    return tempArray;
  }

  mfnCurr(val){
    var formatter = NumberFormat('#,##,000.00');
    var rtn = formatter.format(mfnDbl(val)).toString();
    return rtn;
  }

  mfnValAssign(val,data){
    var value = val;
    try{
      value = data;
    }catch(e){
      value = val;
    }
    return value;
  }

  mfnInt(dbl){
    var lstrInt = 0;
    try {
      lstrInt =  int.parse((dbl??'0.0').toString());
    }
    catch(e){
      lstrInt= 0;
    }
    return lstrInt;
  }


  get wstrAssignMode => _wstrAssignMode;

  set wstrAssignMode(value) {
    _wstrAssignMode = value;
  }

  get wstrLowestPriceWarn => _wstrLowestPriceWarn;

  set wstrLowestPriceWarn(value) {
    _wstrLowestPriceWarn = value;
  }

  get wstrUserDashPerm => _wstrUserDashPerm;

  set wstrUserDashPerm(value) {
    _wstrUserDashPerm = value;
  }

  get wstrUserRepoPerm => _wstrUserRepoPerm;

  set wstrUserRepoPerm(value) {
    _wstrUserRepoPerm = value;
  }

  get wstrUserTranPerm => _wstrUserTranPerm;

  set wstrUserTranPerm(value) {
    _wstrUserTranPerm = value;
  }
}