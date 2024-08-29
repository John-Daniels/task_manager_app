import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/theme/app_colors.dart';

class FabButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isCompleted;

  const FabButton({
    super.key,
    required this.onPressed,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color:
              isCompleted ? context.theme.primaryColor : AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isCompleted ? CupertinoIcons.add : CupertinoIcons.add_circled_solid,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
