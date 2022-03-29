import 'dart:async';

import 'package:get/get.dart';
import 'package:untitled/app/routes/app_pages.dart';
import 'package:untitled/app/services/PrefManager.dart';


class SplashController extends GetxController{

  PrefManager prefManager = PrefManager();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSpalsh();
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

  Future getSpalsh() async {
    Timer(Duration(seconds: 3),() {
      checkUserSessionLogin();
    },);
  }

  checkUserSessionLogin() async
  {
    var isUserLogin = await prefManager.getUserIsLogin();
    printInfo(info: "Is User Login $isUserLogin");
     if(isUserLogin==false){
       Get.offNamed(Routes.LOGIN);
     }else{
      Get.offNamed(Routes.HOME);
     }
  }
}
