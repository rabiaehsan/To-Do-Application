import 'package:get/get.dart';

import '../../splash_screen/splash.dart';
import '../modules/home/home.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signout/bindings/signout_binding.dart';
import '../modules/signout/views/signout_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const Splash(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () =>  Home(),
    ),
    GetPage(
      name: _Paths.SIGNOUT,
      page: () => const SignoutView(),
      binding: SignoutBinding(),
    ),
  ];
}
