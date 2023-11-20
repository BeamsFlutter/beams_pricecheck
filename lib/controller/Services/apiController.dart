

import 'dart:convert';

import 'package:beams_pricecheck/controller/Global/globalValues.dart';
import 'package:beams_pricecheck/controller/Services/appExceptions.dart';
import 'package:beams_pricecheck/controller/Services/baseController.dart';
import 'package:beams_pricecheck/controller/common/common_page.dart';

import 'apiManager.dart';

class ApiCall  with BaseController{


  //============================================GLOBAL CHECK 25/JUL/23

  Future<dynamic> gapiCheckRegister(deviceId) async{

    var request = jsonEncode(<dynamic, dynamic>{
      'DEVICE_ID':deviceId,
      'APP_ID':"TPR",
    });
    dprint('api/check_device_reg');
    dprint(request);
    var response = await ApiManager().postGlobal('api/check_device_reg',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });

    if (response == null) return;
    return response;

  }
  Future<dynamic> gapiDeviceRegister(deviceId,appid,deviceName,mainCompany) async{

    var request = jsonEncode(<dynamic, dynamic>{
      'DEVICE_ID':deviceId,
      'APP_ID':appid,
      'MAIN_COMPANY':mainCompany,
      'DEVICE_NAME':deviceName,
    });
    dprint('api/device_reg');
    dprint(request);
    var response = await ApiManager().postGlobal('api/device_reg',request).catchError((error){
      if (error is BadRequestException) {
      } else {
        handleError(error);
      }
    });
    dprint(response);
    if (response == null) return;

    return response;

  }
  //============================================END GLOBAL CHECK 25/JUL/23

  //Login
  Future<dynamic> userLogin(password,usercd,company,isLoad) async{

    var request = jsonEncode(<dynamic, dynamic>{
      'PASSWORD':password,
      'USERCD':usercd,
      'COMPANY':company,
    });

    var response = await ApiManager().post_ctxt('api/Login',request,isLoad).catchError((error){
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        //Fluttertoast.showToast(msg: apiError["reason"].toString());
      } else {
        handleError(error);
      }
    });

    if (response == null) return;

    return response;
    //print(response);

  }
  //Lookup
  Future<dynamic> LookupSearch(lstrTable,lstrColumn,lstrPage,lstrPageSize,lstrFilter) async {

    var request = jsonEncode(<dynamic, dynamic>{
      "lstrTable" : lstrTable,
      "lstrSearchColumn" :lstrColumn,
      "lstrPage" : lstrPage,
      "lstrLimit": lstrPageSize,
      "lstrFilter" : lstrFilter
    });

    var response = await ApiManager().post('api/lookupSearch',request).catchError((error){
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        //Fluttertoast.showToast(msg: apiError["reason"].toString());
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
    return response;

  }
  Future<dynamic> LookupValidate(lstrTable,lstrFilter) async {

    var request = jsonEncode(<dynamic, dynamic>{
      "lstrTable" : lstrTable,
      "lstrFilter" : lstrFilter
    });
    var response = await ApiManager().post('api/lookupValidate',request).catchError((error){
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        //Fluttertoast.showToast(msg: apiError["reason"].toString());
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
    return response;

  }

  //NextDocno
  Future<dynamic>  nextDocno(doctype,isLoad) async{
    var response = await ApiManager().postLink('api/NextDocNo?lstrDocType='+doctype,isLoad).catchError((error){
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        //Fluttertoast.showToast(msg: apiError["reason"].toString());
      } else {
        handleError(error);
      }
    });

    if (response == null) return;

    return response;
    //print(response);

  }

  //Physical Stock
  Future<dynamic> getStock(company,barCode,lastrLocation,stkCode,mode,isLoad,slCode,userCd,priceLevel,mdoc) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "STKBARCODE":barCode,
      "LOC":lastrLocation,
      "STKCODE":stkCode,
      "MODE":mode,
      "SLCODE":slCode,
      "USER_CD":userCd,
      "PRICELEVEL":priceLevel,
      "MDOC":mdoc
    });
    print('api/getStock');
    print(request);
    var response = await ApiManager().post_ctxt('api/getStock', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    print(response);
    if(response == null)
      return;

    return response;


  }

  Future<dynamic> viewStock(company,docNo,docType,yearcode,mode,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DOCNO":docNo,
      "DOCTYPE":docType,
      "MODE":mode,

    });

    var response = await ApiManager().post_ctxt('api/getPhysicalStock', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }
  Future<dynamic> saveStock(headerList,detailsList,mode,isLoad) async {

    var request = jsonEncode(<dynamic,dynamic>{

      "HEADER_TABLE":headerList,
      "DETAILS_TABLE":detailsList,
      "MODE":mode
    });

    var response = await ApiManager().post_ctxt('api/savePhysicalStock', request,isLoad).catchError((error){

      if(error is BadRequestException){
        var apiError = json.decode(error.message!);

      }else{
        handleError(error);
      }
    });

    if(response == null)
      return ;
    return response;
  }
  Future<dynamic> getBinNum(company,stockCode,lastrLocation) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "STKCODE":stockCode,
      "LOC":lastrLocation,

    });

    var response = await ApiManager().post('api/getBinNumber', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }

  //Other Invoice
  Future<dynamic> getStockDetails(company,doctype,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "DOCTYPE":doctype
    });
    print("api/getPrvDoc");
    var response = await ApiManager().post('api/getPrvDoc', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    print(response);
    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getPrvTables(mdoc,doctype,company,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "MDOC":mdoc,
      "DOCTYPE":doctype,
      "COMPANY":company,
    });

    var response = await ApiManager().post_ctxt('api/getPrvTable', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getPrvItems(company,prvDoctype,prvDocno,prvYearcode,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "PRVDOCTYPE":prvDoctype,
      "PRVDOCNO":prvDocno,
      "PRVYEARCODE":prvYearcode,
    });

    var response = await ApiManager().post_ctxt('api/getPrvTxn', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }

  Future<dynamic> saveVoucher(mode,doctype,loginTime,ipaddress,macid,region,headerTable,detailTable,AddlAmount,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "MODE":mode,
      "DOCTYPE":doctype,
      "LOGINTIME":loginTime,
      "IPADDRESS":ipaddress,
      "MACID":macid,
      "REGION":region,
      "HEADER_TABLE":headerTable,
      "DETAILS_TABLE":detailTable,
      "INV_ADDITIONAL":AddlAmount
    });

    var response = await ApiManager().post_ctxt('api/saveVoucher', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getVoucher(mode,company,yearcode,doctype,docno,isLoad,userCd) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "MODE":mode,
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DOCTYPE":doctype,
      "DOCNO":docno,
      "USER_CD":userCd,
    });

    var response = await ApiManager().post_ctxt('api/getVoucher', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }

  Future<dynamic> deleteVoucher(company,yearcode,doctype,docno,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DOCTYPE":doctype,
      "DOCNO":docno,
    });

    var response = await ApiManager().post_ctxt('api/deleteVoucher', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getDoctype(company,mdoc,userCd,var isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "MDOC":mdoc,
      "COMPANY":company,
      "USER_CODE":userCd,
    });

    var response = await ApiManager().post_ctxt('api/getDoctype', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }


  //Stock Transfer Tsf

  Future<dynamic> getTsfDetails(company,yearcode,doctype,docno,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DOCTYPE":doctype,
      "DOCNO":docno,
    });

    var response = await ApiManager().post_ctxt('api/getTsfDetails', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getTsf(mode,company,yearcode,doctype,docno,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "MODE":mode,
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DOCTYPE":doctype,
      "DOCNO":docno,
    });

    var response = await ApiManager().post_ctxt('api/getTsf', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }
  Future<dynamic> saveTsf(mode,doctype,loginTime,ipaddress,macid,region,headerTable,detailTable,AddlAmount,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "MODE":mode,
      "DOCTYPE":doctype,
      "LOGINTIME":loginTime,
      "IPADDRESS":ipaddress,
      "MACID":macid,
      "REGION":region,
      "HEADER_TABLE":headerTable,
      "DETAILS_TABLE":detailTable,
      "INV_ADDITIONAL":AddlAmount
    });

    var response = await ApiManager().post_ctxt('api/saveTsf', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }
  Future<dynamic> deleteTsf(company,yearcode,doctype,docno,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DOCTYPE":doctype,
      "DOCNO":docno,
    });

    var response = await ApiManager().post_ctxt('api/deleteTsf', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }

  // Stock Reading ------- 27.01.2022
  Future<dynamic> getStockReading(company,barCode,stkCode,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "STKBARCODE":barCode,
      "STKCODE":stkCode,

    });

    var response = await ApiManager().post_ctxt('api/getStockReading', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }


  //SHARE
  Future<dynamic>  mfnShare(docno,doctype,yearcode,mdoc,isLoad) async{
    var response = await ApiManager().postLink('api/Share?DOCNO='+docno+'&DOCTYPE='+doctype+'&YEARCODE='+yearcode+'&CODE='+mdoc+'&PRINT=false',isLoad).catchError((error){
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        //Fluttertoast.showToast(msg: apiError["reason"].toString());
      } else {
        handleError(error);
      }
    });

    if (response == null) return;

    return response;
    //print(response);

  }

  //Attachment
  Future<dynamic> getAttachment(company,yearcode,docno,doctype,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DOCNO":docno,
      "DOCTYPE":doctype,

    });

    var response = await ApiManager().post_ctxt('api/GetAttachment', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }
  Future<dynamic> deleteAttachment(company,yearcode,docno,doctype,srno,isLoad) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DOCNO":docno,
      "DOCTYPE":doctype,
      "SRNO":srno,

    });

    var response = await ApiManager().post_ctxt('api/DeleteAttachment', request,isLoad).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });

    if(response == null)
      return;

    return response;


  }

  //Report
  Future<dynamic> getSalesMan(userCode) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "USER_CD":userCode,
    });

    var response = await ApiManager().post('api/getSalesMan', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    if(response == null)
      return;

    return response;


  }
  Future<dynamic> getCategory() async {



    var response = await ApiManager().post('api/getCategory', '').catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    if(response == null)
      return;

    return response;


  }
  Future<dynamic> getDailySalesRpt(userCode,company,salesList,categoryList,fromDate,toDate) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "USER_CD":userCode,
      "SMAN":salesList,
      "STKGP1":categoryList,
      "COMPANY":company,
      "DATE_FROM":fromDate,
      "DATE_TO":toDate,
    });

    var response = await ApiManager().postLoading('api/DailySalesRpt', request,"S").catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getLocBranch(company) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
    });

    var response = await ApiManager().post('api/getLocBranch', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    if(response == null)
      return;

    return response;


  }
  Future<dynamic> getStockBalanceRpt(userCode,company,yearCode,locList,branchList,categoryList,fromDate,toDate,stkCodeFrom,stkCodeTo,mode,pageNumber,pageSize) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearCode,
      "DATE_TO":toDate,
      "STKGP1":categoryList,
      "LOC_LIST":locList,
      "BRNCODE_LIST":branchList,
      "STKCODE_FROM":stkCodeFrom,
      "STKCODE_TO":stkCodeTo,
      "MODE":mode,
      "PAGE_NO":pageNumber,
      "PAGE_SIZE":pageSize
    });

    var response = await ApiManager().postLoading('api/StockBalance', request,'S').catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getQtnSo(company,yearCode,usercd,datefrom,dateto,sman,pageNumber,pageSize,mode,docno,doctype) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearCode,
      "USER_CD":usercd,
      "DATE_FROM":datefrom,
      "DATE_TO":dateto,
      "SMAN":sman,
      "MODE":mode,
      "PAGE_NO":pageNumber,
      "PAGE_SIZE":pageSize,
      "DOCNO":docno,
      "DOCTYPE":doctype,
    });

    var response = await ApiManager().postLoading('api/QTNRPT', request,'S').catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getSoDo(company,yearCode,usercd,datefrom,dateto,sman,pageNumber,pageSize,mode,docno,doctype) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearCode,
      "USER_CD":usercd,
      "DATE_FROM":datefrom,
      "DATE_TO":dateto,
      "SMAN":sman,
      "MODE":mode,
      "PAGE_NO":pageNumber,
      "PAGE_SIZE":pageSize,
      "DOCNO":docno,
      "DOCTYPE":doctype,
    });

    var response = await ApiManager().postLoading('api/SORPT', request,'S').catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getDocTypeList(company, docType) async {
    var request = jsonEncode(<dynamic, dynamic>{
      "COMPANY": company,
      "MAINDOC": docType,
    });

    var response = await ApiManager().post('api/getDocTypeList', request).catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;

    return response;
  }

  Future<dynamic> getCommonRpt(userCode, company, salesList, docTypeList,docNo,partyCode, fromDate, toDate,pageNo,pageSize) async {
    var request = jsonEncode(<dynamic, dynamic>{
      "SMAN": salesList,
      "DOCTYPE_LIST": docTypeList,
      "USER_CD": userCode,
      "PARTYCODE": partyCode,
      "COMPANY": company,
      "DATE_FROM": fromDate,
      "DATE_TO": toDate,
      "DOCNO": docNo,
      "PAGE_NO": pageNo,
      "PAGE_SIZE": pageSize,
    });

    var response = await ApiManager()
        .post('api/CommonRpt', request)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;

    return response;
  }

  Future<dynamic> getReOrderRpt(company,userCode,machineName,toDate,stockFrom,stockTo,mode,pageNo,pageSize) async {
    var request = jsonEncode(<dynamic, dynamic>{
      "COMPANY": company,
      "USER_CD": userCode,
      "MACHINENAME": machineName,
      "STKCODE_FROM": stockFrom,
      "STKCODE_TO": stockTo,
      "MODE": mode,
      "DATE_TO": toDate,
      "PAGE_NO": pageNo,
      "PAGE_SIZE": pageSize,
    });

    var response = await ApiManager()
        .postLoading('api/ReorderRpt', request,'S')
        .catchError((error) {
      if (error is BadRequestException) {
        //var apiError = json.decode(error.message!);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;

    return response;
  }



  Future<dynamic> getDailySalesRptItem(userCode,company,sMan,category,fromDate,toDate,mode,pageNo,pageSize) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "USER_CD":userCode,
      "SMAN":sMan,
      "STKGP1":category,
      "COMPANY":company,
      "DATE_FROM":fromDate,
      "DATE_TO":toDate,
      "MODE":mode,
      "PAGE_NO":pageNo,
      "PAGE_SIZE":pageSize
    });


    var response = await ApiManager().post('api/DailySalesRpt', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    if(response == null)
      return;

    return response;


  }



  //======================================================================================Dashboard
  Future<dynamic> getAdminDashboard(yearcode,company,fromDate,toDate) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DATE_FROM":fromDate,
      "DATE_TO":toDate
    });


    var response = await ApiManager().post('api/Admin_Dashboard', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    if(response == null)
      return;

    return response;


  }
  Future<dynamic> getDashboardSales(yearcode,company,mode,brnCode) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "MODE":mode, //D,M,W
      "BRNCODE":brnCode, //D,M,W
    });

      dprint('api/dashboard_sales');
      dprint(request);
    var response = await ApiManager().post('api/dashboard_sales', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    dprint(response);
    if(response == null)
      return;

    return response;


  }
  Future<dynamic> getDashboardPaymode(yearcode,company,dateFrom,dateTo,brncode) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DATE_FROM":dateFrom,
      "DATE_TO":dateTo,
      "BRNCODE":brncode,
    });

    dprint('api/dashboard_paymode');
    dprint(request);
    var response = await ApiManager().post('api/dashboard_paymode', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    dprint(response);
    if(response == null)
      return;

    return response;


  }
  Future<dynamic> getDashboardAvg(yearcode,company,dateFrom,dateTo,brnCode) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DATE_FROM":dateFrom,
      "DATE_TO":dateTo,
      "BRNCODE":brnCode,
    });

    dprint('api/dashboard_avg');
    dprint(request);
    var response = await ApiManager().post('api/dashboard_avg', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    dprint(response);
    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getDashStkGroupMast() async {

    dprint('api/stkgroupmaster');
    var response = await ApiManager().postLink('api/stkgroupmaster', "").catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    dprint(response);
    if(response == null)
      return;

    return response;
  }
  Future<dynamic> getDashStkGroupMastDet(group) async {

    var request = jsonEncode(<dynamic,dynamic>{
      "GROUP":group,
    });

    dprint('api/stkgroupdet');
    var response = await ApiManager().post('api/stkgroupdet', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    dprint(response);
    if(response == null)
      return;

    return response;
  }
  Future<dynamic> getDashboardStkGroup(yearcode,company,dateFrom,dateTo,group,brnCode) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DATE_FROM":dateFrom,
      "DATE_TO":dateTo,
      "GROUP":group,
      "BRNCODE":brnCode,
    });

    dprint('api/dashboard_stkgroup');
    dprint(request);
    var response = await ApiManager().post('api/dashboard_stkgroup', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    dprint(response);
    if(response == null)
      return;

    return response;


  }
  Future<dynamic> getDashboardMostSelling(yearcode,company,dateFrom,dateTo,group,limit,brnCode) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DATE_FROM":dateFrom,
      "DATE_TO":dateTo,
      "GROUP":group,
      "LIMIT":limit,
      "BRNCODE":brnCode,
    });

    dprint('api/dashboard_mostselling');
    dprint(request);
    var response = await ApiManager().post('api/dashboard_mostselling', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    dprint(response);
    if(response == null)
      return;

    return response;


  }
  Future<dynamic> getDashboardProductAnalysis(yearcode,company,dateFrom,dateTo,group,limit,mode,brnCode) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DATE_FROM":dateFrom,
      "DATE_TO":dateTo,
      "LIMIT":limit,
      "MODE":mode, //ITEM,GROUP
      "GROUP_LIST":group, // COL_KEY: STKGP1, COL_VAL
      "BRNCODE":brnCode, // COL_KEY: STKGP1, COL_VAL
    });

    dprint('api/dashboard_salesgroup');
    dprint(request);
    var response = await ApiManager().post('api/dashboard_salesgroup', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    dprint(response);
    if(response == null)
      return;

    return response;


  }
  Future<dynamic> getDashboardCustomer(yearcode,company,dateFrom,dateTo,brnCode) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "COMPANY":company,
      "YEARCODE":yearcode,
      "DATE_FROM":dateFrom,
      "DATE_TO":dateTo,
      "BRNCODE":brnCode,
    });

    dprint('api/dashboard_customer');
    dprint(request);
    var response = await ApiManager().post('api/dashboard_customer', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    dprint(response);
    if(response == null)
      return;

    return response;


  }

  Future<dynamic> getPermission(userLevel) async {
    var request = jsonEncode(<dynamic,dynamic>{
      "USERLEVEL":userLevel,
    });

    dprint('api/getmenu');
    dprint(request);
    var response = await ApiManager().post('api/getmenu', request).catchError((error){
      if(error is BadRequestException){
        var apiError = json.decode(error.message!);
      }else{
        handleError(error);
      }
    });
    dprint(response);
    if(response == null)
      return;

    return response;


  }





}