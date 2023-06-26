import 'package:animation_galaxy_bmi/bmi_Calculator/controller/bmi_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BMI_ResultScreen extends StatefulWidget {
  const BMI_ResultScreen({super.key});

  @override
  State<BMI_ResultScreen> createState() => _BMI_ResultScreenState();
}

class _BMI_ResultScreenState extends State<BMI_ResultScreen> {

  BMI_Controller bcontrol = Get.put(BMI_Controller());



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.deepPurple,
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w),
              child: Column(
                children: [

                  Container(alignment: Alignment.centerLeft,child: Text("BMI Calculator",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22.sp))),
                  SizedBox(height: 5.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Your Result",style: TextStyle(fontSize: 35.sp,fontWeight: FontWeight.w600,color: Colors.white),),
                      ],
                    ),
                  ),
                  Container(height: 60.h,width: 100.w,alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),
                    color: Colors.indigo),
                    
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("${bcontrol.bmiData.value}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30.sp,color: Colors.green,fontStyle: FontStyle.italic),),
                        Text("${bcontrol.bmiValue.value.toStringAsFixed(0)}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 75.sp,color: Colors.white),),
                        Text("${bcontrol.bmiData.value}\n skdfjskdfj",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25.sp,color: Colors.white),),

                      ],
                    ),
                  )




                ],
              ),
            ),


            GestureDetector(
              onTap: () => Get.toNamed('/bmiHome'),
              child: Container(
                  height: 8.h,
                  width: 100.w,
                  color: Color(0xFFEB1555),
                  alignment: Alignment.center,
                  child: Text("Recheck BMI",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white),)
              ),
            )
          ],
        ),
      ),
    );
  }


}
