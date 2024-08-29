import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_manager/modules/auth/signup/views/signup_view.dart';
import 'package:task_manager/modules/home/views/home/home_view.dart';
import 'package:task_manager/repositories/auth.dart';

class SigninController extends GetxController {
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  signIn() {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );

      AuthRepository().signin(
          data: {
            'email': email.text,
            'password': password.text,
          },
          onSuccess: () {
            Get.offAllNamed(HomeView.routeName);
          });
    }
  }

  gotoSignup() => Get.toNamed(SignupView.routeName);
}
