import 'package:beams_pricecheck/controller/common/common_page.dart';
import 'package:beams_pricecheck/views/components/common.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';


class ItemScanScreen extends StatefulWidget {
  const ItemScanScreen({super.key});

  @override
  State<ItemScanScreen> createState() => _ItemScanScreenState();
}

class _ItemScanScreenState extends State<ItemScanScreen> {
  
  bool itemFound = true;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: boxBaseDecoraton(const Color(0xFF18253D), 0.0),
          child: Column(
            children: [
               Expanded(
                 child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CouponCard(
                    curvePosition: size.height*0.45,
                    backgroundColor: Colors.white,
                    curveRadius: 60.0,
                    decoration: boxDecorationC(Colors.white, 25,25,0.0,0.0),
                    width: size.width*0.9,
                    height: size.height,
                    borderRadius: 0,
                    firstChild:itemFound? const TicketFirst():Container(),
                    secondChild:itemFound? const TicketEnd():gapHC(0),


                  ),
              ),
               ),
                Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF0C71D4),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60)
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  

                    Column(
                      children: [
                        gapHC(5),
                        Bounce(
                          onPressed: (){
                            setState(() {
                              itemFound=!itemFound;
                            });

                            dprint("SCAN ME..........");
                          },
                          duration: const Duration(milliseconds: 110),
                          child: Container(
                            decoration:  BoxDecoration(
                                gradient: LinearGradient(
                                    colors:[
                                      Colors.blue.shade500,
                                      Colors.blue.shade800,

                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight
                                ),
                                boxShadow:[
                                  BoxShadow(
                                    color:  Colors.blue.shade900,
                                    blurRadius: 9,
                                    spreadRadius: 2,
                                    offset: const Offset(3, 2),
                                  ),
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.2),
                                    blurRadius: 8,
                                    spreadRadius: 7,
                                    offset: const Offset(2, 5),
                                  ),
                                ] ,

                                borderRadius: const BorderRadius.all(Radius.circular(20))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      decoration: boxDecoration(Colors.white, 8),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                                        child: Image.asset("assets/icons/barcode.png",height: 40),
                                      )),
                                  gapWC(20),
                                  const Text("Scan Me",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23

                                  )),
                                  gapWC(20),


                                ],
                              ),
                            ),
                          ),
                        ),
                        gapHC(5),
                        const Row(
                          children: [
                            Text("Powered By ",style: TextStyle(color: Colors.white,fontSize: 12),),
                            Text("BEAMS",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ),

                    
                 ]

                ),
              )
            ],
          )

          


        ),
      ),
    );
  }
}



class TicketFirst extends StatelessWidget {
  const TicketFirst({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text("BASMATI RICE 1KG",style: TextStyle(fontSize: 50,color: Colors.green,fontWeight: FontWeight.bold,height: 0.9), textAlign: TextAlign.center),
             gapHC(5),
              const Text("STK003 | 24242342435435  ",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),

              gapHC(20),
              wOfferWidget("Offer-Code", "OFF34234"),
              wOfferWidget("Offer-Validity", "12-10-2023")



            ],
          ),
        ),

      ],
    );
  }

  wOfferWidget(head,value){
    return
      Row(

        mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Text("${head.toString().toUpperCase()}: ",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
          Text("$value",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
        ],
      );
  }
}
class TicketEnd extends StatelessWidget {
  const TicketEnd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade400))
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("AED 199.00",style: TextStyle(fontSize: 70,color: Colors.black,fontWeight: FontWeight.w900),),
            ],
          ),


        ],
      ),
    );
  }

  wOfferWidget(head,value){
    return
      Row(

        mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Text("$head : ",style: const TextStyle(fontSize: 12),),
          Text("$value",style: const TextStyle(fontSize: 12),),
        ],
      );
  }
}

