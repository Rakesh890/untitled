import '../../app/modules/profile_module/profile_page.dart';
import '../../app/modules/profile_module/profile_bindings.dart';
import '../../app/modules/home_module/home_page.dart';
import '../../app/modules/home_module/home_bindings.dart';
import '../../app/modules/register_module/register_page.dart';
import '../../app/modules/register_module/register_bindings.dart';
import '../../app/modules/login_module/login_page.dart';
import '../../app/modules/login_module/login_bindings.dart';
import '../../app/modules/splash_module/splash_bindings.dart';
import '../../app/modules/splash_module/splash_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
