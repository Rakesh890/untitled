import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/profile_module/profile_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Container(
        child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
