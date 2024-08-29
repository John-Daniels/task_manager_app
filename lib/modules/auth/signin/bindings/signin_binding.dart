import 'package:get/get.dart';
import 'package:task_manager/modules/auth/signin/controllers/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() => SigninController());
  }
}
