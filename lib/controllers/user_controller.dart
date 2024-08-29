import 'package:get/get.dart';
import 'package:task_manager/models/user.dart';
import 'package:task_manager/providers/storage_provider.dart';
import 'package:task_manager/utils/logger/app_logger.dart';

import '../models/response.dart';
import '../repositories/user.dart';
import '../services/auth.dart';

class UserController extends GetxController {
  static UserController I = Get.find<UserController>();
  final Rx<User> _user = AuthService.user!.obs;
  User get user => _user.value;

  @override
  void onReady() {
    AppLogger.d(_user.value.fullName);

    UserRepository.getUserProfile(
      onSuccess: (data) {
        var user = User.fromJson(data.data);
        StorageProvider.store({
          'user': user.toJson(),
        });

        _user.value = user;
        print('Successfully gotthe user');
      },
      onErrorData: (IResponse e) {
        print('error getting user data');
      },
    );
    super.onReady();
  }
}
