import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/services/Api.dart';

import '../../data/provider/UserModel.dart';
import '../../data/repository/ApiServices.dart';
import '../../services/PrefManager.dart';
import '../home_module/home_controller.dart';


class ProfileController extends GetxController{
  HomeController homeCtrl = Get.find();
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
  var userToken ="";


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserDetails();
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

  void getUserDetails() async
  {
    var data = await prefManager.getUserInformation();
    userData = UserModel.fromJson(jsonDecode(data));
    fullNameContoller.text = userData.data!.userDetails!.name!;
    emailControoler.text = userData.data!.userDetails!.email!;
    mobileNumber.text = userData.data!.userDetails!.mobileNo!;
    selectedGenderValue.value = userData.data!.userDetails!.gender!.toUpperCase();
   var index = gender.indexWhere((element) => element.toString().toUpperCase() == selectedGenderValue.value.toUpperCase());
   print(index);
   gender[index].toString();
   chooseGender(gender[index]);
   var dateFormate = userData.data!.userDetails!.dob!.toString();
   dateOfBirthController.text = dateFormate.replaceAll("00:00:00","");
    userToken= await prefManager.getUserToken();
  }

  Future updateProfile() async
  {

    try{
      var params ={
        "full_name":"${fullNameContoller.text}",
        "mobile_no":"${mobileNumber.text}",
        "gender":"${selectedGenderValue.toUpperCase()}",
        "dob":"${dateOfBirthController.text}"
      };
      printInfo(info: "Register Params $params");
      await apiServices.executePost(Api.UpdateUrl,params,userToken).then((value) =>
      {
        if(value != null){
          userData = UserModel.fromJson(value),
          //homeCtrl.userData.data!.userDetails!.fullName = userData.data!.userDetails!.fullName,
          prefManager.removeUserInformation(),
          prefManager.saveUserInformation(jsonEncode(value)),
          homeCtrl.getUserDetails(),
          homeCtrl.userName.value = userData.data!.userDetails!.name!,
          Get.snackbar("Success", "${userData.message}"),
        }
      });
    }catch(err){

    }
  }
}
