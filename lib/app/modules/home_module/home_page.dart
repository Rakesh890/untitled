import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home_module/home_controller.dart';
import 'package:untitled/app/routes/app_pages.dart';
import '../../theme/app_text_theme.dart';


class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),
      actions: [
        IconButton(onPressed: () => controller.openAddContactSheet(), icon: Icon(Icons.add,size: 32,)),
        IconButton(onPressed: (){
          Get.toNamed(Routes.PROFILE);
        }, icon: Icon(Icons.person)),
        IconButton(onPressed: () => controller.logout(), icon: Icon(Icons.logout))
      ]),
      body: Container(
        child: Obx(
          () => (controller.isShowLoader.value == false) ?
          (controller.contactList.length > 0) ? ListView.builder(
              itemCount: controller.contactList.length,
              itemBuilder: (context,int index){
                return  Card(
                  child: ListTile(
                    title: Text("${controller.contactList[index]["name"]}",
                      style: TextStyle(
                          fontSize: 20
                      ),),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Text("${controller.contactList[index]["email"]}",
                          style: TextStyle(
                              fontSize
                                  : 16
                          ),),
                        SizedBox(height: 5,),
                        Text("${controller.contactList[index]["phone_number"]}",
                          style: TextStyle(
                              fontSize: 16
                          ),),
                      ],
                    ),
                  ),
                );
              }) : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("No Contact Data Available",style: contactStyle,),
                SizedBox(height: 10,),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () => controller.openAddContactSheet(),
                  child: Text("Add Contact",style: loginBtnStyle,),)
              ],
            ),
          ): Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
