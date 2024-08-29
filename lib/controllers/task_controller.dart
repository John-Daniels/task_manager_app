import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/repositories/tasks.dart';

class TaskController extends GetxController {
  static TaskController get I => Get.find<TaskController>();

  RxList<Task>? _tasks;

  final _loading = true.obs;
  bool get loading => _loading.value;

  List<Task> get tasks {
    return _tasks?.where((task) => !task.completed).toList() ?? [];
  }

  List<Task> get completedTasks {
    return _tasks?.where((task) => task.completed).toList() ?? [];
  }

  @override
  void onReady() {
    fetchTasks();
    super.onReady();
  }

  fetchTasks() {
    _loading.value = true;
    TaskRepository.getAllTasks(onSuccess: (data) {
      _loading.value = false;
      _tasks = RxList.from(data.data.map((e) => Task.fromMap(e)));
    });
  }

  newTask(Map<String, dynamic> data) {
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );

    TaskRepository.createTask(
      data: data,
      onSuccess: (data) {
        EasyLoading.showSuccess(
          'Task created successfully',
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false,
        );

        fetchTasks();
        Get.back();
      },
    );
  }

  deleteTask(String id) {
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );

    TaskRepository.deleteTask(
      id: id,
      onSuccess: (data) {
        EasyLoading.showSuccess(
          'Task deleted successfully',
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false,
        );

        fetchTasks();
        Get.back();
      },
    );
  }

  markTaskComplete(String id, bool isCompleted) {
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );

    TaskRepository.updateTask(
      id: id,
      data: {'completed': isCompleted},
      onSuccess: (data) {
        EasyLoading.showSuccess(
          'Task marked as ${isCompleted ? 'complete' : 'incomplete'}',
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false,
        );

        fetchTasks();
      },
    );
  }

  // editTask(String id, Map<String, dynamic> data) {
  //   EasyLoading.show(
  //     status: 'loading...',
  //     maskType: EasyLoadingMaskType.black,
  //     dismissOnTap: false,
  //   );

  //   TaskRepository.updateTask(
  //     id: id,
  //     data: data,
  //     onSuccess: (data) {
  //       EasyLoading.showSuccess(
  //         'Task updated successfully',
  //         maskType: EasyLoadingMaskType.black,
  //         dismissOnTap: false,
  //       );

  //       fetchTasks();
  //       Get.back();
  //     },
  //   );
  // }

  void updateTask(Map<String, dynamic> data) {
    EasyLoading.show(
      status: 'Updating...',
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );

    TaskRepository.updateTask(
      id: data['id'],
      data: {
        'title': data['title'],
        'description': data['description'],
        'completed': data['completed'],
      },
      onSuccess: (data) {
        EasyLoading.showSuccess(
          'Task updated successfully',
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false,
        );
        fetchTasks(); // Refresh the task list
        Get.back(); // Close the dialog
      },
      onErrorData: (e) {
        EasyLoading.showError(
          'Failed to update task',
          maskType: EasyLoadingMaskType.black,
          dismissOnTap: false,
        );
      },
    );
  }
}
