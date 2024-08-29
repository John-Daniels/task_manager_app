import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager/modules/auth/signup/controllers/signup_controller.dart';

import '../../../../ui/theme/app_colors.dart';
import '../../../../ui/widgets/text_field.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  static const String routeName = '/signup';

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
                'Sign Up',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Create an account to manage your savings now!',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.bodyText2,
                ),
              ),
              SizedBox(height: 20.h),
              AppTextField(
                controller: controller.fullName,
                label: 'Fullname',
                hintText: 'John Daniels',
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Enter your full name';
                  }
                  if (value != null && value.split(' ').length < 2) {
                    return 'Enter your full name; i.e John Daniels';
                  }

                  return null;
                },
              ),
              SizedBox(height: 18.h),
              AppTextField(
                controller: controller.email,
                label: 'Email',
                hintText: 'johnkoder.dev@gmail.com',
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Enter your email address!';
                  }
                  if (!value!.isEmail) {
                    return 'Enter a valid email address!';
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
                validator: (value) => value != null && value.length < 8
                    ? 'Password should be at least 8 characters'
                    : null,
              ),
              SizedBox(height: 45.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.signUp,
                  child: const Text('Sign up'),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Have an account? '),
                  TextButton(
                    onPressed: controller.gotoSignIn,
                    child: const Text('Sign in'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
