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
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Container(
            child: Container(child: Text("Splash",style: TextStyle(
              fontSize: 24,color: Colors.white
            ),),),
          ),
        ),
      ),
    );
  }
}
