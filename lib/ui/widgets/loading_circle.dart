import 'package:flutter/material.dart';
import 'package:task_manager/ui/theme/app_colors.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      ),
    );
  }
}
