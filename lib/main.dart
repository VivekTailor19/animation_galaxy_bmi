import 'package:animation_galaxy_bmi/bmi_Calculator/screens/bmi_homeScreen.dart';
import 'package:animation_galaxy_bmi/bmi_Calculator/screens/bmi_splashScreen.dart';
import 'package:animation_galaxy_bmi/firstScreen.dart';
import 'package:animation_galaxy_bmi/galaxy/screens/galaxy_homeScreen.dart';
import 'package:animation_galaxy_bmi/galaxy/screens/galaxy_splashScreen.dart';
import 'package:animation_galaxy_bmi/galaxy/screens/planetViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'bmi_Calculator/screens/bmi_resultScreen.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
       // initialRoute: "/planetview",
        routes: {
          "/" : (p0) => FirstScreen(),
          "/bmi":(p0) => BMI_SplashScreen(),
          "/bmiHome":(p0) => BMI_HomeScreen(),
          "/bmiResult":(p0) => BMI_ResultScreen(),

          "/galaxy":(p0) => Galaxy_SplashScreen(),
          "/galaxyHome":(p0) => Galaxy_HomeScreen(),
          "/planetview":(p0) => PlanetViewScreen(),
        },
      ),
    ),
  );
}



//    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