import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {
                Get.toNamed("/bmi");
              }, child: Text("BMI Calculator",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22.sp),)),
              SizedBox(height: 45.h),
              TextButton(onPressed: () {
                Get.toNamed("/galaxy");
              }, child: Text("Galaxy",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22.sp))),
            ],
          ),
        ),
      ),
    );
  }
}
