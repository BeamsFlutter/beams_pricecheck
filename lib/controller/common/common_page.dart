
import 'dart:ui';

import 'package:beams_pricecheck/views/Styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



// Box Decoration with Gradient
BoxDecoration boxGradientDecoration(gradientNum, double radius) =>
    BoxDecoration(
      gradient: LinearGradient(
          colors: GradientTemplate.gradientTemplate[gradientNum].colors,
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight
      ),
      boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(4, 4)

        )],
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );

BoxDecoration boxGradientRoundCLBR(gradientNum,tl,tr,bl,br)=>BoxDecoration(
    gradient: LinearGradient(
      colors: GradientTemplate.gradientTemplate[gradientNum].colors,
        begin: Alignment.centerLeft,
        end: Alignment.bottomRight
    ),

    borderRadius: BorderRadius.only(topLeft:Radius.circular(tl),topRight:Radius.circular(tr),bottomLeft:Radius.circular(bl),bottomRight:Radius.circular(br))
);






BoxDecoration boxBgDecoration(gradientNum, double radius) =>
    BoxDecoration(
        gradient: LinearGradient(
            colors: GradientTemplate.gradientTemplate[gradientNum].colors,
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight
        ),
        boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(4, 4)

        )],
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        backgroundBlendMode: BlendMode.overlay
    );

BoxDecoration boxBaseGradientDecoration(gradientNum, double radius) =>
    BoxDecoration(
      gradient: LinearGradient(
          colors: GradientTemplate.gradientTemplate[gradientNum].colors,
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight
      ),
     
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );


// Box Decoration ----

BoxDecoration boxDecoration(color,double radius) => BoxDecoration(
  color: color,
  boxShadow: [
    BoxShadow(
      color: Colors.blueAccent.withOpacity(0.2),
      blurRadius: 8,
      spreadRadius: 1,
      offset: const Offset(4, 4),
    ),
  ],
  borderRadius: BorderRadius.all(Radius.circular(radius)),
);
BoxDecoration boxBaseDecoration(color,double radius) => BoxDecoration(
  color: color,
  borderRadius: BorderRadius.all(Radius.circular(radius)),
);
BoxDecoration boxBaseDecorationC(color,double tl,double tr,double bl,double br) => BoxDecoration(
  color: color,
  borderRadius: BorderRadius.only(topLeft: Radius.circular(tl),topRight: Radius.circular(tr),bottomLeft: Radius.circular(bl),bottomRight: Radius.circular(br)),
);


BoxDecoration roundBoxDecoration(color, double radius) =>
    BoxDecoration(
      color: color,

      boxShadow: [
        BoxShadow(
            color: Colors.blue.withOpacity(0.0),
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(4, 4)

        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );

BoxDecoration boxColorDecoration(color, radius) =>
    BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 3,
              offset: Offset(0, 0)
          )
        ]
    );

BoxDecoration halfBoxColorDecoration(color, radius, gradientNum) =>
    BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),

        ),
        gradient: LinearGradient(
            colors: GradientTemplate.gradientTemplate[gradientNum].colors,
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 3,
              offset: Offset(0, 0)
          )
        ]
    );

// by using values
BoxDecoration boxColorDecoration_BySize(color, radius) =>
    BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 3,
              offset: Offset(0, 0)
          )
        ]
    );
BoxDecoration boxColorDecorationNew(color, radius,gradientNum) =>
    BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        gradient: LinearGradient(
            colors: GradientTemplate.gradientTemplate[gradientNum].colors,
            begin: Alignment.center,
            end: Alignment.bottomRight
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 3,
              offset: Offset(0, 0)
          )
        ]
    );

BoxDecoration boxOutlineDecoration(color,double radius) => BoxDecoration(
  color: color,

  border: Border.all(
    color: Colors.black,width: 0.0,
  ),
  borderRadius: BorderRadius.all(Radius.circular(radius)),


);

BoxDecoration boxOutlineCustom(color,double radius,borderColor) => BoxDecoration(
  color: color,
  border: Border.all(
    color: borderColor,width: 1.0,
  ),
  borderRadius: BorderRadius.all(Radius.circular(radius)),


);
BoxDecoration boxOutlineCustom1(color,double radius,borderColor,width) => BoxDecoration(
  color: color,
  border: Border.all(
    color: borderColor,width: width,
  ),
  borderRadius: BorderRadius.all(Radius.circular(radius)),


);
BoxDecoration boxOutlineCustom2(color,double radius,borderColor,width) => BoxDecoration(
  color: color,
  border: Border.all(
    color: borderColor,width: width,
  ),
  borderRadius: BorderRadius.all(Radius.circular(radius)),


);
BoxDecoration boxOutlineInput(enablests,focusSts) => BoxDecoration(
  color: Colors.white,
  border: Border.all(
    color:enablests? (focusSts?Colors.blue: Colors.black.withOpacity(0.5)):Colors.grey.withOpacity(0.5),width: 0.9,
  ),
  borderRadius: const BorderRadius.all(Radius.circular(5)),


);
BoxDecoration boxImageDecoration(img,double radius) => BoxDecoration(
    image: DecorationImage(
        image: AssetImage(img),
        fit: BoxFit.cover
    ),
    borderRadius: BorderRadius.all(Radius.circular(radius))
);


//------------------------------------------------------Text Styles

Text h1(text) => Text(text,style: const TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 20,color: PrimaryText),);
Text h2(text) => Text(text,style: const TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 18,color: PrimaryText),);
Text h3(text) => Text(text,style: const TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 17,color: PrimaryText),);

Text s1(text) => Text(text,style: const TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 18,color: titleSubText),);
Text s2(text) => Text(text,style: const TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 16,color: titleSubText),);
Text s3(text) => Text(text,style: const TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 14,color: titleSubText),);
Text s4(text) => Text(text,style: const TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 12,color: titleSubText),);


Text ch(text,color) => Text(text,style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 30,color: color),);
Text tc(text,color,double size) => Text(text,style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: size,color: color),);
Text tco(text,color,double size) => Text(text,overflow:  TextOverflow.ellipsis , style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: size,color: color),);
Text tl(text,color,double size) => Text(text,style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: size,fontStyle: FontStyle.italic,color: color),);
Text ts(text,color,double size) => Text(text,style: TextStyle(fontFamily: 'Roboto',fontSize: size,color: color),);
Text tso(text,color,double size) => Text(text, overflow:  TextOverflow.ellipsis ,style: TextStyle(fontFamily: 'Roboto',fontSize: size,color: color),);



Text tc_normal(text, color, double size) =>
    Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size,
          color: color
      ),
    );

SizedBox gapH() =>
    SizedBox(
      height: 20,
    );

SizedBox gapHC(double h) =>
    SizedBox(
      height: h,
    );

SizedBox gapW() =>
    SizedBox(
      width: 20,
    );

SizedBox gapWC(double w) =>
    SizedBox(
      width: w,
    );

Image imageSet(image, size) =>
    Image.asset(
      image,
      width: size,
    );


//

Scaffold pageMenuScreen(child, Size size, context, bottom, fnPageBack) =>
    Scaffold(
      appBar: navigationAppBar(context, fnPageBack),
      bottomNavigationBar: bottom,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: pagePadding(),
          margin: pageMargin(),
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      ),
    );

Scaffold pageMenuScreen_new(child, Size size, context, bottom, fnPageBack) =>
    Scaffold(
     // appBar: navigationAppBar(context, fnPageBack),
      bottomNavigationBar: bottom,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: pagePadding_NEW(),
          margin: pagePadding_NEW(),
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      ),
    );


AppBar navigationAppBar(context, fnPageBack) =>
    AppBar(
      backgroundColor: Colors.white12,
      elevation: 0,
      leading: Container(
        margin: EdgeInsets.only(left: 10),
        child: InkWell(
          onTap: () {
            fnPageBack();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
      actions: [Container()],
    );


EdgeInsets pagePadding() => EdgeInsets.all(10);

EdgeInsets pageMargin() =>
    EdgeInsets.only(left: 25, right: 20, top: 0, bottom: 0);



// ========================= NEW
EdgeInsets pagePadding_NEW() => EdgeInsets.all(5);

EdgeInsets pageMargin_NEW() =>
    EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0);



// ------------ Row design for listing items------------------

Row rowItem(title,value) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            tc(title, Colors.black87, 14),
            tc_normal(value, Colors.black, 14),
          ],
        ),
      ],
    );
// item card design

Card cardDesign(color,sColor,child) =>
    Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      color: color,
      shadowColor: sColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: child,

    );

//===========================LINE====================

Container line() => Container(
  height: 1,
  decoration: boxBaseDecoration(Colors.black, 1),
);
Container lineC(color,height) => Container(
  height: height,
  decoration: boxBaseDecoration(color, 1),
);



showLoaderDialog(BuildContext context ){
  AlertDialog alert=AlertDialog(

    content: new Row(
      children: [
        CupertinoActivityIndicator(
          animating: true,
          radius: 50,
        ),
        //Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
      ],),

  );
  showDialog(
    barrierDismissible: false,
    context:context,
    barrierColor: Colors.transparent,
    builder:(BuildContext context){
      return alert;
    },
  );
}


fnShow(BuildContext context,mode) {
  showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return mode =="1"? CupertinoActivityIndicator(
        animating: true,
        radius: 50,
      ):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/Gifs/loadingf.gif",width: 200,),
          tc('No Result !!', greyLight, 15)
        ],
      );
    },
  );
}

closeAlert(BuildContext context){
  Navigator.pop(context);
}

//Animation Controller

Column empty()=>  Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Row(),
    Image.asset("assets/Gifs/nothinggif.gif",width: 200,),
    tc('No Result !!', greyLight, 15)
  ],
);


Column title(head,icon,hh){
  return Column(
    children: [
      gapHC(hh),
      lineC(greyLight, 1.0),
      gapHC(hh),
      Row(
        children: [
          Icon(icon,size: 12,),
          gapWC(5),
          tc(head, Colors.black, 12),

        ],
      ),
      gapHC(hh),
      lineC(greyLight, 1.0),
      gapHC(hh),
    ],
  );
}


//======================================================================Date

setDate(mode,DateTime date){
  var dateRtn  = "";
  var formatDate1 = DateFormat('yyyy-MM-dd hh:mm:ss');
  var formatDate2 = DateFormat('yyyy-MM-dd');
  var formatDate3 = DateFormat('yyyy-MM-dd hh:mm');
  var formatDate4 = DateFormat('yyyy-MM-dd hh:mm:ss a');
  var formatDate5 = DateFormat('hh:mm:ss a');
  var formatDate6 = DateFormat('dd-MM-yyyy');
  var formatDate7 = DateFormat('dd-MM-yyyy hh:mm:ss a');
  var formatDate8 = DateFormat('dd-MM-yyyy hh:mm:ss');
  var formatDate9 = DateFormat('dd-MM-yyyy hh:mm');
  var formatDate10 = DateFormat('HH:mm:ss');
  var formatDate11 = DateFormat('hh:mm a');
  var formatDate12 = DateFormat('yyyy-MM-dd');
  var formatDate13 = DateFormat('dd MMMM yyyy  | hh:mm:ss a');
  var formatDate14 = DateFormat('hh:mm:ss a');
  var formatDate15 = DateFormat('MMMM');
  var formatDate16 = DateFormat('EEEE');
  var formatDate17 = DateFormat('dd MMMM yyyy');
  var formatDate18 = DateFormat('dd-MM-yyyy HH:mm:ss');
  var formatDate19 = DateFormat('hh:mm');
  var formatDate20 = DateFormat('dd-MM-yy');

  try{
    switch(mode){
      case 1:{
        dateRtn =  formatDate1.format(date);
      }
      break;
      case 2:{
        dateRtn =  formatDate2.format(date);
      }
      break;
      case 3:{
        dateRtn =  formatDate3.format(date);
      }
      break;
      case 4:{
        dateRtn =  formatDate4.format(date);
      }
      break;
      case 5:{
        dateRtn =  formatDate5.format(date);
      }
      break;
      case 6:{
        dateRtn =  formatDate6.format(date);
      }
      break;
      case 7:{
        dateRtn =  formatDate7.format(date);
      }
      break;
      case 8:{
        dateRtn =  formatDate8.format(date);
      }
      break;
      case 9:{
        dateRtn =  formatDate9.format(date);
      }
      break;
      case 10:{
        dateRtn =  formatDate10.format(date);
      }
      break;
      case 11:{
        dateRtn =  formatDate11.format(date);
      }
      break;
      case 12:{
        dateRtn =  formatDate12.format(date);
      }
      break;
      case 13:{
        dateRtn =  formatDate13.format(date);
      }
      break;
      case 14:{
        dateRtn =  formatDate14.format(date);
      }
      break;
      case 15:{
        dateRtn =  formatDate15.format(date);
      }
      break;
      case 16:{
        dateRtn =  formatDate16.format(date);
      }
      break;
      case 17:{
        dateRtn =  formatDate17.format(date);
      }
      break;
      case 18:{
        dateRtn =  formatDate18.format(date);
      }
      break;
      case 19:{
        dateRtn =  formatDate19.format(date);
      }
      break;
      case 20:{
        dateRtn =  formatDate20.format(date);
      }
      break;
      default: {
        //statements;
      }
      break;

    }



  }catch(e){
    if (kDebugMode) {
      print(e);
    }
  }

  return dateRtn;

}

//================================================== Debug Print
dprint(msg){
  if (kDebugMode) {
    print(msg);
  }
}
