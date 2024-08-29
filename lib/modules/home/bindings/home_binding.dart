import 'package:get/get.dart';
import 'package:task_manager/controllers/task_controller.dart';
import 'package:task_manager/controllers/user_controller.dart';
import 'package:task_manager/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<TaskController>(TaskController(), permanent: true);
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
