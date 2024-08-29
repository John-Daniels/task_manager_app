import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/controllers/task_controller.dart';
import 'package:task_manager/controllers/user_controller.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/services/auth.dart';

import '../../../models/user.dart';
import '../../../ui/widgets/dialogs.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  final _loading = true.obs;
  bool get loading => _loading.value || tasks.isEmpty;

  User get user => UserController.I.user;
  List<Task> get tasks => TaskController.I.tasks;
  List<Task> get completedTasks => TaskController.I.completedTasks;
  TaskController get tasksController => TaskController.I;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    _loading.value = false;

    super.onInit();

    tabController.addListener(() {
      if (tabController.index == 0) {
        _isCompleted.value = true;
      } else {
        _isCompleted.value = false;
      }
    });
  }

  @override
  onClose() {
    tabController.dispose();
  }

  addTask() {
    AppDialogs.newTask();
  }

  final _isCompleted = true.obs;
  bool get isCompleted => _isCompleted.value;

  logoutUser() {
    AuthService.logout();
  }
}
