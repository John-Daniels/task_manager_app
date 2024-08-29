import 'package:get/get.dart';

import '../modules/auth/signin/bindings/signin_binding.dart';
import '../modules/auth/signin/views/signin_view.dart';
import '../modules/auth/signup/views/signup_view.dart';
import '../modules/auth/signup/bindings/signup_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

class AppPages {
  AppPages._();
  static String initial = SplashView.routeName;

  static final routes = [
    GetPage(
      name: SplashView.routeName,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: HomeView.routeName,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: SignupView.routeName,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: SigninView.routeName,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
  ];
}
