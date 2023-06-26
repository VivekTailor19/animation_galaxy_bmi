import 'dart:math';
import 'dart:ui';

import 'package:animation_galaxy_bmi/galaxy/controller/galaxy_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PlanetViewScreen extends StatefulWidget {
  const PlanetViewScreen({super.key});

  @override
  State<PlanetViewScreen> createState() => _PlanetViewScreenState();
}

class _PlanetViewScreenState extends State<PlanetViewScreen> with SingleTickerProviderStateMixin {

  AnimationController? gAniController;

  @override
  void initState() {
    super.initState();

    gAniController = AnimationController(vsync: this, duration: Duration(seconds: 5));

    gAniController!.repeat(reverse: false);
    gAniController!.addListener(() {
      setState(() {  });
    });
  }

  @override
  void dispose() {
    gAniController!.dispose();
    super.dispose();
  }

  GalaxyController gcontrol = Get.put(GalaxyController());


  @override
  Widget build(BuildContext context) {

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade800,

        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 5.h,left: 5.w,right: 5.w),
              child: Column(
                children: [
                  Stack(
                    children: [

                      Container(
                        height: 30.h,width: 100.w,margin: EdgeInsets.only(top:9.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.w),
                            color: Colors.indigo.shade500),

                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.all(8.w),

                        child: Column(mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("${gcontrol.planetlist[index].name}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 30.sp),),


                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: 1.h),
                              child: Text("Milkyway Galaxy",style: TextStyle(fontSize: 14.sp,color: Colors.white60),),
                            ),

                            SizedBox(height: 2.h),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset("assets/galaxy/distance.png",height: 2.h,width: 2.h,fit: BoxFit.fill,),
                                    SizedBox(width: 2.w,),
                                    Text("${gcontrol.planetlist[index].sunDistance} m km",style: TextStyle(fontSize: 11.sp,color: Colors.white60,fontWeight: FontWeight.w300),)
                                  ],
                                ),

                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset("assets/galaxy/gravity.png",height: 2.h,width: 2.h,fit: BoxFit.fill,),
                                    SizedBox(width: 2.w,),
                                    Text("${gcontrol.planetlist[index].gravity} m/s",style: TextStyle(fontSize: 11.sp,color: Colors.white60,fontWeight: FontWeight.w300),),
                                    Text("2",style: TextStyle(fontSize: 12.sp,color: Colors.white60,fontWeight: FontWeight.w300,fontFeatures:[FontFeature.numerators()] ),),
                                  ],
                                )
                              ],
                            )


                          ],
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(backgroundColor: Colors.indigo.shade500,
                                Column(
                                  children: [
                                    Container(height: 8.h,width: 100.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only( bottomLeft: Radius.circular(3.w),bottomRight: Radius.circular(3.w)),
                                          gradient: LinearGradient(colors: [Colors.blue.shade800,Colors.lightBlue.shade300])
                                      ),
                                      alignment: Alignment.center,

                                      child: Text("Welcome to ${gcontrol.planetlist[index].name}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22.sp,color: Colors.white70),),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 3.h),
                                      child: AnimatedBuilder(
                                        animation: gAniController!,
                                        builder: (context, child) {
                                          return Transform.rotate(angle: gAniController!.value*pi*2,child: child);
                                        },
                                        child: Container(height: 17.h,width:17.h,decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage("${gcontrol.planetlist[index].imgPath}"),fit: BoxFit.fill),
                                            shape: BoxShape.circle
                                        ),),
                                      ),
                                    ),
                                    SizedBox(height: 2.h,),

                                    Text("Distance to Sun",style: TextStyle(fontSize: 12.sp,color: Colors.white60),),
                                    Text("${gcontrol.planetlist[index].sunDistance} million km",style: TextStyle(fontSize: 22.sp,color: Colors.white,fontWeight: FontWeight.w400),),
                                    SizedBox(height: 3.h,),
                                    Text(gcontrol.planetlist[index].name == "EARTH" ? "" :  "Distance to Earth",style: TextStyle(fontSize: 12.sp,color: Colors.white60),),
                                    Text(gcontrol.planetlist[index].name == "EARTH" ? "" :  "${gcontrol.planetlist[index].earthDistance} million km",style: TextStyle(fontSize: 22.sp,color: Colors.white,fontWeight: FontWeight.w400),),

                                  ],
                                ),
                                );
                          },
                          child: AnimatedBuilder(
                            animation: gAniController!,
                            builder: (context, child) {
                              return Transform.rotate(angle: gAniController!.value*pi*2,child: child);
                            },
                            child: Container(height: 17.h,width:17.h,decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("${gcontrol.planetlist[index].imgPath}"),fit: BoxFit.fill),
                                shape: BoxShape.circle
                            ),),
                          ),
                        ),
                      ),


                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: Text("OVERVIEW",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20.sp,color: Colors.white),),
                  ),

                  Text("${gcontrol.planetlist[index].data}",style: TextStyle(fontSize: 14.sp,color: Colors.white60,fontWeight: FontWeight.w400),textAlign: TextAlign.justify,),


                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                //gAniController!.dispose();
                Get.back();
              },
              child: Container(height: 8.h,width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only( topLeft: Radius.circular(3.w),topRight: Radius.circular(3.w)),
                    gradient: LinearGradient(colors: [Colors.blue.shade800,Colors.lightBlue.shade300])
                ),
                alignment: Alignment.centerRight,

                padding: EdgeInsets.only(right: 5.w),

                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back_ios_new,size: 22.sp,color: Colors.white70),
                    SizedBox(width:2.w),
                    Text("BACK",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.sp,color: Colors.white70),),
                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
