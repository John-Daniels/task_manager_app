import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task_manager/modules/auth/signin/controllers/signin_controller.dart';
import 'package:task_manager/ui/theme/app_colors.dart';
import 'package:task_manager/ui/widgets/text_field.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  static const String routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h),
              Text(
                'Log In',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.bodyText2,
                ),
              ),
              SizedBox(height: 20.h),
              AppTextField(
                controller: controller.email,
                label: 'Email',
                hintText: 'johnkoder.dev@gmail.com',
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Enter your email address!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 18.h),
              AppTextField(
                controller: controller.password,
                label: 'Password',
                hintText: '**********',
                obscurable: true,
              ),
              SizedBox(height: 45.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.signIn,
                  child: const Text('Sign in'),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont have an Account? '),
                  TextButton(
                    onPressed: controller.gotoSignup,
                    child: const Text('Sign Up'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
