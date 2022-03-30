import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/data/provider/UserModel.dart';
import 'package:untitled/app/modules/home_module/BottomSheet/ContactSheet.dart';
import 'package:untitled/app/routes/app_pages.dart';
import 'package:untitled/app/services/PrefManager.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeController extends GetxController{

  PrefManager prefManager = PrefManager();
  UserModel userData = UserModel();
  var userName = "".obs;

  TextEditingController fullNameContoller = TextEditingController();
  TextEditingController emailControoler = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  var contactList = [].obs;
  final Future<FirebaseApp> _initFirebase = Firebase.initializeApp();
  var isShowLoader=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getUserDetails();
    getUserContacts();
    super.onInit();

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

  getUserDetails() async
  {
    var data = await prefManager.getUserInformation();
    if(data != null){
      userData = UserModel.fromJson(jsonDecode(data));
      userName.value = userData.data!.userDetails!.name!;
      printInfo(info: "User Details ${userData.data!.userDetails!.fullName}");
    }

  }

  logout()
  {
    prefManager.removeLogout();
    Get.offNamed(Routes.LOGIN);
  }

  openAddContactSheet()
  {
    Get.bottomSheet(ContactAddASheet(),
      // isScrollControlled: true,
    );
  }


 Future getUserContacts() async
  {
    isShowLoader.value=true;
    try{
      FirebaseFirestore.instance
          .collection('UserContacts')
          .get()
          .then((QuerySnapshot querySnapshot)
      {
        contactList.clear();
        querySnapshot.docs.forEach((DocumentSnapshot doc)
        {
          isShowLoader.value=false;
          if(doc.get("userId").toString() == userData.data!.userDetails!.id.toString())
          {
            var contacts = {
              "name":doc.get("name"),
              "email":doc.get("email"),
              "phone_number":doc.get("name"),
              "userId":doc.get("userId"),
            };
            contactList.add(contacts);
            contactList.value = contactList.toSet().toList();
          }
        });
      });
    }catch(Error){
      printInfo(info: "Something Went wriong");
    }
  }

    Future<void> saveContact()
    {
     isShowLoader.value=true;
      // Call the user's CollectionReference to add a new user
      return FirebaseFirestore.instance.collection("UserContacts")
          .add({
        "name":"${fullNameContoller.text}",
        "email":"${emailControoler.text}",
        "phone_number":"${mobileNumber.text}",
        "userId":userData.data!.userDetails!.id.toString(),
      }).then((value) =>
      {
        Get.back(),
        isShowLoader.value=false,
        fullNameContoller.clear(),
        emailControoler.clear(),
        mobileNumber.clear(),
        if(value != null){
          Get.snackbar("","Successfully Added Contact"),
          getUserContacts(),
        }

      }).catchError((error) => print("Failed to add user: $error"));
  }
}
