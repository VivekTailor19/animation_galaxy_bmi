import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMI_Controller extends GetxController
{
  RxInt weight = 40.obs;
  RxInt age = 10.obs;
  RxDouble height = 100.0.obs;

  Rx<Color> male = Colors.pink.obs;
  Rx<Color> female = Colors.white.obs;


  void clickedGender(String gender)
  {
    Color unselected = Colors.white;
    Color selected = Colors.pinkAccent;
    if(gender=="Male")
      {
        male.value = selected;
        female.value = unselected;
      }
    else
      {
        male.value = unselected;
        female.value = selected;
      }
  }

  void changeHeight(double dheight)
  {
    height.value = dheight;
  }

  void increaseWeight()
  {
    weight.value ++;
  }

  void decreaseWeight()
  {
    weight.value --;
  }

  void increaseAge()
  {
    age.value ++;
  }

  void decreaseAge()
  {
    age.value --;
  }


  RxDouble bmiValue = 20.0.obs;
  RxString bmiData = "normal".obs;
  void calculateBMI()
  {
     bmiValue.value  = (weight.value/ (height.value * height.value)) * 10000;

    if(bmiValue.value < 16)
      {
        bmiData.value = "Severe Thinness";
      }
    else if(bmiValue.value < 17 && bmiValue.value >= 16)
      {
        bmiData.value = "Moderate Thinness";
      }
    else if(bmiValue.value < 18.5 && bmiValue.value >= 17)
      {
        bmiData.value = "Mild Thinness";
      }
    else if(bmiValue.value < 25 && bmiValue.value >= 18.5)
      {
        bmiData.value = "Normal";
      }
    else if(bmiValue.value < 30 && bmiValue.value >= 25)
    {
      bmiData.value = "OverWeight";

    }
    else
      {
        bmiData.value = "Obese Class";
      }

    print(bmiData);

  }


}