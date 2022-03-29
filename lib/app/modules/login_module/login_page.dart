import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/login_module/login_controller.dart';
import 'package:untitled/app/routes/app_pages.dart';

import '../../services/ValidationService.dart';
import '../../theme/app_text_theme.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        child: Obx(() => (controller.isShowLoader.value == false)
            ? Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
                    //Email widget
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
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

                    //Password widget
                    Container(
                      margin:
                          EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      child: Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: controller.passwordVisible.value,
                          validator: (val) => validatePassword(val!),
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
                              labelText: 'Password',
                              counterText: "",
                              suffixIcon: TextButton(
                                child: Text(
                                  // Based on passwordVisible state choose the icon
                                  !controller.passwordVisible.value
                                      ? "Show"
                                      : "Hide",
                                  // color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () => controller.showPassword(),
                              )),
                          maxLength: 20,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    //Login Button
                    RaisedButton(
                        onPressed: () => controller.loginButton(),
                        color: Colors.blue,
                        elevation: 0,
                        child: Text(
                          "Login",
                          style: loginBtnStyle,
                        )),

                    TextButton(
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                      child: Text("Create New Account"),
                    )
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              )),
      ),
    );
  }
}
