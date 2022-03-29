import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/register_module/register_controller.dart';

import '../../routes/app_pages.dart';
import '../../services/ValidationService.dart';
import '../../theme/app_text_theme.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      body: Container(
        child: Form(
          key: controller.registerFormKey,
          child: ListView(
            children: [
              //Full Name widget
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

              Container(
                margin: EdgeInsets.only(top: 20),
                height: 30,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.gender.length,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                groupValue:
                                    controller.selectedGenderValue.toString(),
                                value: controller.gender[index].toString(),
                                onChanged: (value) =>
                                    controller.chooseGender(value),
                              ),
                              Text("${controller.gender[index].toString()}")
                            ],
                          ),
                        );
                      }),
                ),
              ),

              //Date Of birth
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  controller: controller.dateOfBirthController,
                  validator: (val) => validateDateOfBirth(val!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  onTap: () => controller.selectDateOfBirth(context),
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
                      labelText: 'Date Of Birth Number',
                      counterText: ""),
                  maxLength: 10,
                ),
              ),

              //Password widget
              Container(
                margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
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
                            !controller.passwordVisible.value ? "Show" : "Hide",
                            // color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () => controller.showPassword(),
                        )),
                    maxLength: 20,
                  ),
                ),
              ),
              //Confirm Password widget
              Container(
                margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                child: Obx(
                  () => TextFormField(
                    controller: controller.confirmPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: controller.confirmPasswordVisible.value,
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
                            !controller.confirmPasswordVisible.value
                                ? "Show"
                                : "Hide",
                            // color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () => controller.showConfirmPassword(),
                        )),
                    maxLength: 20,
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),
              //Login Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: RaisedButton(onPressed: () => controller.registerBtn(),
                    color: Colors.blue,
                    elevation: 0,
                    child: Text("Register",style: loginBtnStyle,)),
              ),

              TextButton(
                onPressed: () => Get.toNamed(Routes.LOGIN),
                child: Text("Have an Account? Login"),
              )
            ],
          ),
        ),
      ),
    );
  }


}
