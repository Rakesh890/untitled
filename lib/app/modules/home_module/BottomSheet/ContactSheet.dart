import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home_module/home_controller.dart';

import '../../../services/ValidationService.dart';
import '../../../theme/app_text_theme.dart';

class ContactAddASheet extends GetView<HomeController> {
  ContactAddASheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: AnimatedPadding(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeOut,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 370,
          color: Colors.white,
          child: Scaffold(
            body: Column(children: [
              AppBar(
                elevation: 1,
                title: Text("Add Contacts"),
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.clear),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  controller: controller.fullNameContoller,
                  validator: (val) => validateName(val!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintStyle: inputStyle,
                      labelText: 'Full Name',
                      counterText: ""),
                  maxLength: 50,
                ),
              ),
              //Email widget
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  controller: controller.emailControoler,
                  validator: (val) => validateEmail(val!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintStyle: inputStyle,
                      labelText: 'Email',
                      counterText: ""),
                  maxLength: 50,
                ),
              ),
              //Mobile Number  widget
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  controller: controller.mobileNumber,
                  validator: (val) => validateMobile(val!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintStyle: inputStyle,
                      labelText: 'Mobile Number',
                      counterText: ""),
                  maxLength: 10,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              RaisedButton(
                onPressed: () => controller.saveContact(),
                color: Colors.blue,
                child: Text(
                  "Add",
                  style: loginBtnStyle,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
