import '../modules/auth/signin/views/signin_view.dart';
import '../modules/auth/signup/views/signup_view.dart';
import '../modules/home/views/home/home_view.dart';
import '../modules/splash/views/splash_view.dart';

abstract class Routes {
  Routes._();

  static const splash = SplashView.routeName;
  static const home = HomeView.routeName;
  static const signin = SigninView.routeName;
  static const signup = SignupView.routeName;
}
