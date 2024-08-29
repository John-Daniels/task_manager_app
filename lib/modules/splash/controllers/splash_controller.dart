import 'package:get/get.dart';
import 'package:task_manager/modules/auth/signin/views/signin_view.dart';
import 'package:task_manager/providers/storage_provider.dart';

import '../../home/views/home/home_view.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        var token = StorageProvider.get('token');
        if (token != null) {
          return Get.offAndToNamed(HomeView.routeName);
        }

        Get.offAndToNamed(SigninView.routeName);
      },
    );

    super.onReady();
  }
}
