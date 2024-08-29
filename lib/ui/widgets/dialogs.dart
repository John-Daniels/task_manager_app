import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/ui/widgets/edit_task_dialog.dart';
import 'package:task_manager/ui/widgets/new_task_dialog.dart';

class AppDialogs {
  static Future newTask() {
    return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => const NewTaskDialog(),
    );
  }

  static Future editTask({required Task task}) {
    return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => EditTaskDialog(
        task: task,
      ),
    );
  }
}
