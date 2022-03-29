import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  var seriveRespose;

//For Get Request
  Future executeGet(serviceName) async
  {
   try{
     await http.get(Uri.parse(serviceName)).then((value) =>
     {
       if(value.statusCode == 200){
         seriveRespose = jsonDecode(value.body),
       }else{
         printInfo(info: "Something Went Wrong"),
       }
     }
     );
   }catch(err){
     return Exception("Something went wrong");
   }
    //Get return value from Server Side and It Will return value
    return seriveRespose;
  }
  Future executePost(serviceName,body) async
  {
    try{
      await http.post(Uri.parse(serviceName),body: body).then((value) =>
      {
        print(value),
        if(value.statusCode == 200){
          seriveRespose = jsonDecode(value.body),
        }else{
          printInfo(info: "Something Went Wrong 1"),
        }
      }
      );
    }catch(err){
      return Exception("Something went wrong 2");
    }
    //Get return value from Server Side and It Will return value
    return seriveRespose;
  }
}