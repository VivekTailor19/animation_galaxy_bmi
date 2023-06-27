import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
      child: Scaffold(backgroundColor: Colors.indigo,

          body: Center(
            child: Column(
              children: [
                SizedBox(height: 10.h,),
                Container(height: 20.h,width: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("assets/heart.png"),fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 5.h,),
                Text("BMI CALCULATOR",style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.w400),),
                Spacer(),
                CircularProgressIndicator(color: Colors.pink,),
                SizedBox(height: 2.h,),
                Text("Check your BMI",style: TextStyle(fontSize: 16.sp,color: Colors.white70,fontWeight: FontWeight.w300),),
                SizedBox(height: 10.h,)
              ],
            ),
          )
      ),
    );
  }
}
