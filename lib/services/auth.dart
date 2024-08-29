import 'package:get/get.dart';

import '../models/user.dart';
import '../modules/splash/views/splash_view.dart';
import '../providers/storage_provider.dart';

class AuthService {
  static User? get user {
    return StorageProvider.get('user', (e) => User.fromJson(e));
  }

  static logout() {
    StorageProvider.clear();
    Get.offAllNamed(SplashView.routeName);
  }
}
