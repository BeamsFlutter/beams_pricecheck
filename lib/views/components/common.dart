import 'package:beams_pricecheck/views/components/alertDialog.dart';
import 'package:flutter/material.dart';

Text th(text,color,double size) => Text(text,style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: size,color: color),);
Text tcn(text,color,double size,[height]) => Text(text,style: TextStyle(fontSize: size,color: color,height: height));


//===========================================================DECORATION
BoxDecoration boxGradientTCBC(color1,color2,radius)=>BoxDecoration(
    gradient: LinearGradient(
      colors: [
        color1,
        color2
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    borderRadius: BorderRadius.all(Radius.circular(radius))
);

BoxDecoration boxGradientRoundTCBC(color1,color2,tl,tr,bl,br)=>BoxDecoration(
    gradient: LinearGradient(
      colors: [
        color1,
        color2
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),

    borderRadius: BorderRadius.only(topLeft:Radius.circular(tl),topRight:Radius.circular(tr),bottomLeft:Radius.circular(bl),bottomRight:Radius.circular(br))
);

BoxDecoration boxBaseDecoraton(color,double radius) => BoxDecoration(
  color: color,
  borderRadius: BorderRadius.all(Radius.circular(radius)),
);
BoxDecoration boxDecorationC(color,double tl,double tr,double bl,double br,) => BoxDecoration(
  color: color,
  boxShadow: [
    BoxShadow(
      color: Colors.blueAccent.withOpacity(0.1),
      blurRadius: 8,
      spreadRadius: 1,
      offset: Offset(4, 4),
    ),
  ],
  borderRadius: BorderRadius.only(topLeft:Radius.circular(tl),topRight:Radius.circular(tr),bottomLeft:Radius.circular(bl),bottomRight:Radius.circular(br)),

);


//============================================================Message

errorMsg(context,msg){
  PageDialog().showMessage(context, msg,"CLOSE","E","");
}

successMsg(context,msg){
  PageDialog().showMessage(context, msg,"CLOSE","S","");
}

warningMsg(context,msg){
  PageDialog().showMessage(context, msg,"CLOSE","W","");
}

infoMsg(context,msg){
  PageDialog().showMessage(context, msg,"CLOSE","I","");
}

customMsg(context,msg,icon){
  PageDialog().showMessage(context, msg,"CLOSE","C",icon);
}

msgBox(context,msg,mode,icon){
  PageDialog().showMessage(context, msg,"",mode,icon);
}