

import 'package:beams_pricecheck/controller/common/common_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  //GLOBAL

  //PAGE VARIABLE
  var blScreenSaver = false;
  final List<String> imgList = [
    'assets/images/T1.jpg',
    'assets/images/T2.jpg',
    'assets/images/T3.png',
    'assets/images/T4.png',
    'assets/images/T5.jpg',
  ];

  //CONTROLLER
  TextEditingController txtBarcode = TextEditingController();
  FocusNode fnBarcode = FocusNode();

  @override
  void initState() {
    super.initState();
    fnBarcode.requestFocus();
  }

  @override
  void dispose() {
    txtBarcode.dispose();
    fnBarcode.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: blScreenSaver? Container(
          decoration: boxBaseDecoration(Colors.white, 0),
          child: CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1.0
            ),
            items: imgList
                .map((item) => Container(
              decoration: boxImageDecoration(item, 0),
            ))
                .toList(),
          ),
        ):Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RawKeyboardListener(
              autofocus: true,
              focusNode: fnBarcode,
              onKey: (e) {

                if (e.character != null) {
                  dprint("hello");
                  dprint(e.character!);
                }
              },
              child: TextField(
                showCursor: true,
                controller: txtBarcode,
                onChanged: (value){
                  dprint(value);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
