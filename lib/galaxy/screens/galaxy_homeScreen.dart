import 'dart:math';
import 'dart:ui';

import 'package:animation_galaxy_bmi/galaxy/controller/galaxy_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Galaxy_HomeScreen extends StatefulWidget {
  const Galaxy_HomeScreen({super.key});

  @override
  State<Galaxy_HomeScreen> createState() => _Galaxy_HomeScreenState();
}

class _Galaxy_HomeScreenState extends State<Galaxy_HomeScreen> with SingleTickerProviderStateMixin {

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

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.indigo.shade800,
        appBar: AppBar(
          elevation: 0,
          leading: Icon(Icons.menu_rounded,size: 22.sp,color: Colors.white,),
          title: Text("GALAXY PLANETS",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400,color: Colors.white),),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded),iconSize: 22.sp,color: Colors.white,)],
          centerTitle: true,
        ),

        body: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 3.h,left: 5.w,right: 5.w),
            child: GestureDetector(
              onTap: () {

                //gAniController!.dispose();

                Get.toNamed("/planetview",arguments: index);
              },
              child: PlanetTile(
                name: gcontrol.planetlist[index].name,
                  imgPath: gcontrol.planetlist[index].imgPath,
                  distance: gcontrol.planetlist[index].sunDistance,
                  gravity: gcontrol.planetlist[index].gravity
              ),
            ),
          );
        },
          itemCount: gcontrol.planetlist.length,
        )
      ),
    );
  }

  Widget PlanetTile({String? name, String? imgPath, double? distance, double? gravity}) {
    return Container(height: 23.h,width: 100.w,

          child: Stack(

            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(height: 22.h,width: 72.w,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),
                      color: Colors.indigo.shade500),

                  padding: EdgeInsets.only(left: 18.w,top: 3.5.h,right: 5.w,bottom: 3.5.h),

                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("$name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25.sp),),
                        Icon(Icons.more_vert_outlined,size: 18.sp,color: Colors.white70,)
                      ],),


                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 0.5.h),
                        child: Text("Milkyway Galaxy",style: TextStyle(fontSize: 12.sp,color: Colors.white60),),
                      ),

                      SizedBox(width: 10.w,child: Divider(height: 1.h,thickness: 2,color: Colors.lightBlue,)),

                      Spacer(),

                      Row(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/galaxy/distance.png",height: 2.h,width: 2.h,fit: BoxFit.fill,),
                              SizedBox(width:1.w),
                              Text("$distance m km",style: TextStyle(fontSize: 9.sp,color: Colors.white60,fontWeight: FontWeight.w300),)
                            ],
                          ),
                          SizedBox(width: 5.w,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/galaxy/gravity.png",height: 2.h,width: 2.h,fit: BoxFit.fill,),
                              SizedBox(width:1.w),
                              Text("$gravity m/s",style: TextStyle(fontSize: 9.sp,color: Colors.white60,fontWeight: FontWeight.w300),),
                              Text("2",style: TextStyle(fontSize: 10.sp,color: Colors.white60,fontWeight: FontWeight.w300,fontFeatures:[FontFeature.numerators()] ),),
                            ],
                          )
                        ],
                      )


                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedBuilder(
                  animation: gAniController!,
                  builder: (context, child) {
                    return Transform.rotate(angle: gAniController!.value*pi*2,child: child);
                  },
                  child: Container(height: 16.h,width:15.h,decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("$imgPath"),fit: BoxFit.fill),
                      shape: BoxShape.circle
                  ),),
                ),
              ),


            ],
          ),
        );
  }
}
