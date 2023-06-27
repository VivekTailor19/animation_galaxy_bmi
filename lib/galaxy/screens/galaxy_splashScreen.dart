import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Galaxy_SplashScreen extends StatefulWidget {
  const Galaxy_SplashScreen({super.key});

  @override
  State<Galaxy_SplashScreen> createState() => _Galaxy_SplashScreenState();
}

class _Galaxy_SplashScreenState extends State<Galaxy_SplashScreen> {

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),() => Get.toNamed("/galaxyHome"),);

    return SafeArea(
      child: Scaffold(
        body: Container(height: 100.h,width: 100.w,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/solar.jpg"),fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
