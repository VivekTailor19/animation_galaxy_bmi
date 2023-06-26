import 'package:animation_galaxy_bmi/bmi_Calculator/controller/bmi_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BMI_HomeScreen extends StatefulWidget {
  const BMI_HomeScreen({super.key});

  @override
  State<BMI_HomeScreen> createState() => _BMI_HomeScreenState();
}

class _BMI_HomeScreenState extends State<BMI_HomeScreen> {

  BMI_Controller bcontrol = Get.put(BMI_Controller());



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.deepPurple,
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("BMI Calculator",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22.sp)),
                  SizedBox(height: 2.h,),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          bcontrol.clickedGender("Male");

                        },
                        child: Container(height: 45.w,width: 45.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),color: Colors.indigo),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx( () =>  Icon(Icons.male_rounded,size: 50.sp,color: bcontrol.male.value,)),
                              Text("Male",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          bcontrol.clickedGender("Female");

                        },
                        child: Container(height: 45.w,width: 45.w,alignment: Alignment.center,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),color: Colors.indigo),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(() => Icon(Icons.female_rounded,size: 50.sp,color: bcontrol.female.value,)),
                              Text("Female",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(height: 28.h,width: 100.w,alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 3.w),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),color: Colors.indigo),
                    child:Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Height",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w200),),
                        Obx(() =>  Text("${bcontrol.height.value.toStringAsFixed(0)} cm",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)),
                        Obx(
                              () =>  Slider(value: bcontrol.height.value,
                            onChanged: (value) {
                              bcontrol.changeHeight(value);
                            },
                            thumbColor: Color(0xFFEB1555),
                            activeColor: Colors.pinkAccent,inactiveColor: Colors.white,
                            max: 350,min: 45,),
                        )
                      ],
                    ),

                  ),



                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 45.w,width: 45.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),color: Colors.indigo),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Weight",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),),
                            Obx(() => Text("${bcontrol.weight.value}",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w300),)),
                            SizedBox(height: 1.h,),
                            Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                              GestureDetector(
                                onTap: () => bcontrol.increaseWeight(),
                                child: Container(width:11.w,height: 11.w,alignment: Alignment.center,
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                                  child: Icon(Icons.add,size: 20.sp,color: Colors.white,),),
                              ),
                              SizedBox(width: 5.w),
                              GestureDetector(
                                onTap: () => bcontrol.decreaseWeight(),
                                child: Container(width:11.w,height: 11.w,alignment: Alignment.center,
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                                  child: Icon(Icons.remove,size: 20.sp,color: Colors.white,),),
                              ),
                            ],),
                          ],
                        ),
                      ),
                      Container(height: 45.w,width: 45.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),color: Colors.indigo),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Age",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),),
                            Obx(() =>  Text("${bcontrol.age.value}",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w300),)),
                            SizedBox(height: 1.h,),
                            Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                              GestureDetector(
                                onTap: () => bcontrol.increaseAge(),

                                child: Container(width:11.w,height: 11.w,alignment: Alignment.center,
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xFF4C4F5E)),
                                  child: Icon(Icons.add,size: 20.sp,color: Colors.white,),),
                              ),
                              SizedBox(width: 5.w),
                              GestureDetector(
                                onTap: () => bcontrol.decreaseAge(),
                                child: Container(width:11.w,height: 11.w,alignment: Alignment.center,
                                  decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xFF4C4F5E)),
                                  child: Icon(Icons.remove,size: 20.sp,color: Colors.white,),),
                              ),
                            ],),
                          ],
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),


            GestureDetector(
              onTap: ()  {
                bcontrol.calculateBMI();
                Get.toNamed("/bmiResult");
              },
              child: Container(
                  height: 8.h,
                  width: 100.w,
                  color: Color(0xFFEB1555),
                  alignment: Alignment.center,
                  child: Text("Calculate Your BMI",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white),)
              ),
            )
          ],
        ),
      ),
    );
  }


}
