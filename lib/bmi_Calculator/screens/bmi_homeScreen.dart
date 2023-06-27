import 'package:animation_galaxy_bmi/bmi_Calculator/controller/bmi_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BMI_HomeScreen extends StatefulWidget {
  const BMI_HomeScreen({super.key});

  @override
  State<BMI_HomeScreen> createState() => _BMI_HomeScreenState();
}

class _BMI_HomeScreenState extends State<BMI_HomeScreen> with SingleTickerProviderStateMixin {

  BMI_Controller bcontrol = Get.put(BMI_Controller());

  AnimationController? bmiAniControl;

  Animation? leftTween;
  Animation? rightTween;
  Animation? alignTween;



  @override
  void initState() {
    super.initState();

    bmiAniControl = AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    leftTween = Tween<Alignment>(begin: Alignment(-300,0),end:Alignment(0,0) ).animate(bmiAniControl!);
    rightTween = Tween<Alignment>(begin: Alignment(300,0),end:Alignment(0,0) ).animate(bmiAniControl!);

    alignTween = Tween<Alignment>(begin: Alignment(20,0), end: Alignment(0,0)).animate(bmiAniControl!);

    bmiAniControl!.forward();
    bmiAniControl!.addListener(() {
      setState((){});
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xff000E21),
        body: Column(
          children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("BMI Calculator",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 22.sp)),
                      IconButton(icon: Icon(Icons.refresh_rounded),color: Colors.white, iconSize:20.sp,
                      onPressed: () {

                        bcontrol.male.value = false;
                        bcontrol.female.value = false;
                        bcontrol.weight.value = 0;
                        bcontrol.height.value = 0;
                        bcontrol.age.value = 0;

                      },)
                    ],
                  ),
                  SizedBox(height: 2.h,),

                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: leftTween!.value,
                          child: GestureDetector(
                            onTap: () {
                              bcontrol.clickedGender("Male");

                            },
                            child: Container(height: 45.w,width: 45.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),color: Color(0xff111F38)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Obx( () =>  Icon(Icons.male_rounded,size: 50.sp,
                                    color: bcontrol.male.value == true ? Colors.pinkAccent : Colors.white)),
                                  Text("Male",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: Align(
                          alignment: rightTween!.value,
                          child: GestureDetector(
                            onTap: () {
                              bcontrol.clickedGender("Female");

                            },
                            child: Container(height: 45.w,width: 45.w,alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),color: Color(0xff111F38)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Obx(() => Icon(Icons.female_rounded,size: 50.sp,
                                    color: bcontrol.female.value == true ? Colors.pinkAccent : Colors.white,)),
                                  Text("Female",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),

                  // Align(
                  //   alignment: alignTween!.value,
                  //   //left: 1.w,
                  //   // right: centerTween!.value,
                  //   child: Container(height: 200,width: double.infinity,
                  //     //alignment: Alignment.center,
                  //
                  //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),
                  //       color: Color(0xff111F38)),
                  //   child:Column(mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text("Height",style: TextStyle(fontSize: 22.sp,color: Colors.white,fontWeight: FontWeight.w500),),
                  //       SizedBox(height: 1.h,),
                  //       Obx(() =>  Text("${bcontrol.height.value.toStringAsFixed(0)} cm",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)),
                  //       Obx(
                  //             () =>  Slider(value: bcontrol.height.value,
                  //           onChanged: (value) {
                  //             bcontrol.changeHeight(value);
                  //           },
                  //           thumbColor: Color(0xFFEB1555),
                  //           activeColor: Colors.pinkAccent,inactiveColor: Colors.white,
                  //           max: 350,min: 0,),
                  //       )
                  //     ],
                  //   ),
                  //
                  // ),
                  //   ),


                  Align(
                    alignment: alignTween!.value,
                    child: Container(
                      height: 28.h,
                      width: 95.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.w),
                          color: Color(0xff111F38)),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            "Height",
                            style: TextStyle(
                                fontSize: 22.sp,color: Colors.white,fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 1.h,),
                          Obx(() => Text(
                            '${bcontrol.height.value.toStringAsPrecision(3)} cm',
                            style: TextStyle(
                                fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),
                          )),
                          SizedBox(height: 1.5.h,),
                          Obx(
                                () => Slider(
                              value: bcontrol.height.value,
                              onChanged: (value) {
                                bcontrol.height.value = value;
                              },
                              max: 200,
                              divisions: 200,
                              inactiveColor: Colors.white24,
                              activeColor: Colors.pink,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 2.h,),


                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment:leftTween!.value,
                          child: Container(height: 45.w,width: 45.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),color: Color(0xff111F38)),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Weight",style: TextStyle(fontSize: 22.sp,color: Colors.white,fontWeight: FontWeight.w500),),
                                SizedBox(height: 1.h,),
                                Obx(() => Text("${bcontrol.weight.value}",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)),
                                SizedBox(height: 1.5.h,),
                                Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                                  GestureDetector(
                                    onTap: () => bcontrol.increaseWeight(),
                                    child: Container(width:13.w,height: 13.w,alignment: Alignment.center,
                                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white12),
                                      child: Icon(Icons.add,size: 20.sp,color: Colors.white,),),
                                  ),
                                  SizedBox(width: 5.w),
                                  GestureDetector(
                                    onTap: () => bcontrol.decreaseWeight(),
                                    child: Container(width:13.w,height: 13.w,alignment: Alignment.center,
                                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white12),
                                      child: Icon(Icons.remove,size: 20.sp,color: Colors.white,),),
                                  ),
                                ],),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: Align(
                          alignment:rightTween!.value,
                          child: Container(height: 45.w,width: 45.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),color: Color(0xff111F38)),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Age",style: TextStyle(fontSize: 22.sp,color: Colors.white,fontWeight: FontWeight.w500),),
                                SizedBox(height: 1.h,),
                                Obx(() =>  Text("${bcontrol.age.value}",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w400),)),
                                SizedBox(height: 1.5.h,),
                                Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                                  GestureDetector(
                                    onTap: () => bcontrol.increaseAge(),

                                    child: Container(width:13.w,height: 13.w,alignment: Alignment.center,
                                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white12),
                                      child: Icon(Icons.add,size: 20.sp,color: Colors.white,),),
                                  ),
                                  SizedBox(width: 5.w),
                                  GestureDetector(
                                    onTap: () => bcontrol.decreaseAge(),
                                    child: Container(width:13.w,height: 13.w,alignment: Alignment.center,
                                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white12),
                                      child: Icon(Icons.remove,size: 20.sp,color: Colors.white,),),
                                  ),
                                ],),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),


            GestureDetector(
              onTap: ()  {
                if(bcontrol.male.value == false && bcontrol.female.value == false)
                  {
                    Get.showSnackbar(GetSnackBar(
                      title: "Note",
                      message: 'Please Select Gender',
                      duration: const Duration(seconds: 2),),
                    );
                  }

                else if(bcontrol.height.value==0)
                {
                  Get.showSnackbar(GetSnackBar(
                    title: "Note",
                    message: 'Please Select Height',
                    duration: const Duration(seconds: 2),),
                  );
                }

                else if(bcontrol.weight.value==0)
                {
                  Get.showSnackbar(GetSnackBar(
                    title: "Note",
                    message: 'Please Select Weight',
                    duration: const Duration(seconds: 2),),
                  );
                }

                else if(bcontrol.age.value==0)
                {
                  Get.showSnackbar(GetSnackBar(
                    title: "Note",
                    message: 'Select your Age',
                    duration: const Duration(seconds: 2),),
                  );
                }

                else if(
                (bcontrol.male.value == true || bcontrol.female.value ==true)
                    && bcontrol.height.value!=0
                    && bcontrol.weight.value!=0
                    && bcontrol.age.value!=0)
                  {
                    bcontrol.calculateBMI();
                    Get.toNamed("/bmiResult");
                  }

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
