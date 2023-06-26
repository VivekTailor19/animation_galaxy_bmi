import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMI_SplashScreen extends StatefulWidget {
  const BMI_SplashScreen({super.key});

  @override
  State<BMI_SplashScreen> createState() => _BMI_SplashScreenState();
}

class _BMI_SplashScreenState extends State<BMI_SplashScreen> {
  @override
  Widget build(BuildContext context) {
    
    Future.delayed(Duration(seconds: 3),() => Get.toNamed("/bmiHome"),);
    
    return SafeArea(
      child: Scaffold(
        
        body: Center(child: Container(height: 60,width: 60,color: Colors.amber,)),
      ),
    );
  }
}
