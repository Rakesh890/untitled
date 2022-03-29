import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/provider/UserModel.dart';
import 'package:untitled/app/data/repository/ApiServices.dart';
import 'package:untitled/app/routes/app_pages.dart';
import 'package:untitled/app/services/Api.dart';
import 'package:untitled/app/services/PrefManager.dart';


class LoginController extends GetxController{

  var passwordVisible=false.obs;
  late TextEditingController emailControoler,passwordController;
  GlobalKey<FormState> loginFormKey = GlobalKey();
  ApiServices apiServices = ApiServices();
  UserModel userData = UserModel();
  PrefManager prefManager = PrefManager();
  var isShowLoader = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initComponents();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  initComponents()
  {
    emailControoler = TextEditingController();
    passwordController = TextEditingController();
  }
  showPassword()
  {
    if(passwordVisible == false)
      {
        passwordVisible.value =true;
      }else{
      passwordVisible.value = false;
    }
  }

  loginButton()
  {
    if(loginFormKey.currentState!.validate()){
      print("Come in this section");
      var email = emailControoler.text.toString();
      var password = passwordController.text.toString();
      callLoginApi(email,password);
    }else{
      print("Come in this");
    }
  }

  Future callLoginApi(String email, String password) async
  {
    isShowLoader.value=true;
    try{
      var params ={
      "email":"$email",
      "password":"$password",
      };
      apiServices.executePost(Api.LoginUrl, params).then((value) =>
      {

        if(value != null){
          userData = UserModel.fromJson(value),
          if(userData.success == true)
          {
            isShowLoader.value=false,
            print(userData.toJson().toString()),
            GetSnackBar(message: userData.message.toString(),),
            prefManager.isUserlogin(true),
            prefManager.saveUserInformation(jsonEncode(value)),
            Get.offAllNamed(Routes.HOME),
          }else{
            prefManager.isUserlogin(false),
            Get.offAllNamed(Routes.LOGIN),
          }
        }
      });
    }finally{
      isShowLoader.value=false;
    }
  }

}
