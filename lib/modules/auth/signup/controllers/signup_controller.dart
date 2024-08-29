import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_manager/repositories/auth.dart';

class SignupController extends GetxController {
  var fullName = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  signUp() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );

      AuthRepository().signup(
        data: {
          'fullName': fullName.text,
          'email': email.text,
          'password': password.text,
        },
        onSuccess: () {},
      );

      // Future.delayed(const Duration(seconds: 2), () {
      // });
    }
  }

  gotoSignIn() => Get.back();
}
