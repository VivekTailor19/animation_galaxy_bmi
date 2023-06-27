import 'package:get/get.dart';

class BMI_Controller extends GetxController
{
  RxInt weight = 0.obs;
  RxInt age = 0.obs;
  RxDouble height = 0.0.obs;

  RxBool male = false.obs;
  RxBool female = false.obs;


  void clickedGender(String gender)
  {

    if(gender=="Male")
      {
        if(male.value == true)
          {
            male.value = false;
          }
        else{
          male.value = true;
          female.value = false;
        }

      }
    else
      {
        if(female.value == true)
        {
          female.value = false;
        }
        else{
          female.value = true;
          male.value = false;
        }

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
    if(weight.value>=1)
      {
        weight.value --;
      }

  }

  void increaseAge()
  {
    age.value ++;
  }

  void decreaseAge()
  {
    if(age.value >=1)
      {
        age.value --;
      }

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