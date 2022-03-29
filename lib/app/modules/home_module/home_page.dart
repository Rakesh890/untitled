import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home_module/home_controller.dart';
import 'package:untitled/app/routes/app_pages.dart';


class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),
      actions: [
        IconButton(onPressed: (){
          Get.toNamed(Routes.PROFILE);
        }, icon: Icon(Icons.person)),
        IconButton(onPressed: () => controller.logout(), icon: Icon(Icons.logout))
      ]),
      body: Container(
        child: Column(
          children: [
           IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 32,)),

          ],
        ),
      ),
    );
  }
}
