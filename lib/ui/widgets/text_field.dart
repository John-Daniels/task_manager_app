import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final String? label;
  final TextEditingController? controller;
  final bool obscurable;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType? keyboardType;

  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.label,
    this.obscurable = false,
    this.validator,
    this.onTap,
    this.readOnly = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label!,
                style: TextStyle(
                  fontSize: 11.sp,
                ),
              )
            : Container(),
        SizedBox(height: 6.h),
        TextFormField(
          onTap: onTap,
          obscureText: obscurable,
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyboardType,
          validator: validator ??
              (text) {
                if (text == null || text.isEmpty) {
                  return label == null
                      ? 'Field is Required!'
                      : 'Enter a ${label?.toLowerCase()}';
                }
                return null;
              },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
