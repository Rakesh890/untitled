import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled/app/data/provider/UserModel.dart';
import 'package:untitled/app/routes/app_pages.dart';
import 'package:untitled/app/services/PrefManager.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeController extends GetxController{

  PrefManager prefManager = PrefManager();
  UserModel userData = UserModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserDetails();
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

  void getUserDetails() async
  {
    var data = await prefManager.getUserInformation();
    userData = UserModel.fromJson(jsonDecode(data));
    printInfo(info: "User Details ${userData.data!.userDetails!.fullName}");
  }

  logout()
  {
    prefManager.removeLogout();
    Get.offNamed(Routes.LOGIN);
  }
}
