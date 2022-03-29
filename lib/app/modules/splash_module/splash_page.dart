import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/splash_module/splash_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Container(child: Text("Splash Screen"),),
          ),
        ),
      ),
    );
  }
}
