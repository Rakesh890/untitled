import 'package:shared_preferences/shared_preferences.dart';

class PrefManager
{
  isUserlogin(bool value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isUserLogin", value);
  }

  getUserIsLogin() async
  {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("isUserLogin") ?? false;
  }

  saveUserInformation(value) async
  {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("userInfo", value);
  }

  getUserInformation() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("userInfo");
  }

  removeLogout() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove("isUserLogin");
  }
}