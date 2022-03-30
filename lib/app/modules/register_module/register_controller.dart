import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/provider/UserModel.dart';
import 'package:untitled/app/data/repository/ApiServices.dart';
import 'package:untitled/app/modules/home_module/home_controller.dart';
import 'package:untitled/app/services/Api.dart';
import 'package:untitled/app/services/PrefManager.dart';

import '../../routes/app_pages.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class RegisterController extends GetxController
{

  GlobalKey<FormState> registerFormKey = GlobalKey();
  TextEditingController emailControoler = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameContoller = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  ApiServices apiServices = ApiServices();
  UserModel userData = UserModel();
  PrefManager prefManager = PrefManager();

  var passwordVisible = false.obs;
  var selectedDate = "".obs;
  var confirmPasswordVisible = false.obs;
  List gender = ["Male", "Female", "Other"];
  var selectedGenderValue = "Male".obs;
  var isShowloader=false.obs;

  var sevriceResponse;

  showPassword() {
    if (passwordVisible == false) {
      passwordVisible.value = true;
    } else {
      passwordVisible.value = false;
    }
  }

  showConfirmPassword() {
    if (confirmPasswordVisible == false) {
      confirmPasswordVisible.value = true;
    } else {
      confirmPasswordVisible.value = false;
    }
  }

  selectDateOfBirth(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      firstDate: DateTime(1970),
      lastDate: DateTime(2025),
      initialDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate)
      selectedDate.value = selected.year.toString() +
          "-" + "${(int.parse(selected.month.toString()) < 10) ? "0"+selected.month.toString() : selected.month.toString() }"+
          "-" + "${ (int.parse(selected.day.toString()) < 10) ? "0"+selected.day.toString() : selected.day.toString()}";
    dateOfBirthController.text = selectedDate.value;
    print(selectedDate.value.toString());
  }

  chooseGender(gender) {
    if (gender == "Male") {
      selectedGenderValue.value = gender;
    } else if (gender == "Female") {
      selectedGenderValue.value = gender;
    } else {
      selectedGenderValue.value = gender;
    }
    print("Selected Gender ${selectedGenderValue.value}");
  }

  //
 Future registerBtn() async{
    if (registerFormKey.currentState!.validate())
    {
      isShowloader.value=true;
      try {
        var params = {
          "full_name": "${fullNameContoller.text}",
          "email": "${emailControoler.text}",
          "mobile_no": "${mobileNumber.text}",
          "password": "${passwordController.text}",
          "c_password": "${confirmPassword.text}",
          "gender": "${selectedGenderValue.toString().toUpperCase()}",
          "dob": "${dateOfBirthController.text.toString()}"
        };
        printInfo(info: "Params $params");
        await apiServices.executePost(Api.RegisterUrl, params).then((value) =>
        {
          isShowloader.value=false,
          if(value != null){
            sevriceResponse = value,
            userData = UserModel.fromJson(sevriceResponse),
            if(userData.success == true){
              Get.snackbar("Success", "${ userData.message.toString()}"),
              prefManager.isUserlogin(true),
              //Save User info In Local Storage
              prefManager.saveUserInformation(jsonEncode(sevriceResponse)),
              //Save User Token In Local Storage
              prefManager.saveUserToken(userData.data!.token.toString()),
              Get.offNamed(Routes.HOME),
            }else{
              isShowloader.value=false,
              // GetSnackBar(title: userData.message, message :sevriceResponse["data"]["email"].toString()),
              Get.snackbar("Error", "${ userData.message.toString()}"),
              prefManager.isUserlogin(true),
            }
          },
          printInfo(info: "Register info $value"),
        });
      } catch (err)
      {
        isShowloader.value=false;
      }
    }else{
      Get.snackbar("Error", "All Fileds are reuired");
   }
  }
}
