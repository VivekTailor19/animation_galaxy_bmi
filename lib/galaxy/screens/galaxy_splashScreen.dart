import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        body: Center(child: Container(height: 80,width: 80,color: Colors.indigoAccent,)),
      ),
    );
  }
}
