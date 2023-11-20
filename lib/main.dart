import 'package:beams_pricecheck/views/pages/itemScan.dart';
import 'package:beams_pricecheck/views/pages/pricescreen.dart';
import 'package:beams_pricecheck/views/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Price Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    //  home: const PriceScreen(),
    //  home: const ItemScanScreen(),
      home: const SplashScreen(),
    );
  }
}
