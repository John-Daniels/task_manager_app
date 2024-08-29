import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/logger/app_logger.dart';

import '../constants/api_constant.dart';
import '../models/user.dart';
import '../modules/home/views/home/home_view.dart';
import '../providers/api_provider.dart';
import '../providers/storage_provider.dart';

class AuthRepository {
  signup({
    required Map<String, dynamic> data,
    Function()? onSuccess,
    Function(Map)? onErrorData,
  }) async {
    try {
      var res = await ApiProvider.request.post(
        API.signup,
        data: data,
      );

      EasyLoading.showSuccess('success!');
      var user = User.fromJson(res.data['data']);

      StorageProvider.store({
        'user': user.toJson(),
        'token': user.token,
      });

      if (onSuccess != null) onSuccess();
      Get.offAllNamed(HomeView.routeName);
    } on DioException catch (e) {
      var res = e.response!;
      var data = res.data;
      if (onErrorData != null) onErrorData(e.response!.data);
      if (res.statusCode == 409) {
        return EasyLoading.showError(
          data['message'],
          duration: const Duration(seconds: 2),
          dismissOnTap: true,
        );
      }

      EasyLoading.showError(
        'Something went wrong! try again later',
        duration: const Duration(seconds: 2),
        dismissOnTap: true,
      );
    }
  }

  signin({
    required Map<String, dynamic> data,
    Function()? onSuccess,
    Function(Map)? onErrorData,
  }) async {
    catchError(callback: () async {
      var res = await ApiProvider.request.post(
        API.signin,
        data: data,
      );

      EasyLoading.showSuccess('success!');
      var user = User.fromJson(res.data['data']);

      StorageProvider.store({
        'user': user.toJson(),
        'token': user.token,
      });

      if (onSuccess != null) return onSuccess();
    });

    // } on DioError catch (e) {
    //   var res = e.response!;
    //   var data = res.data;

    //   if (onErrorData != null) onErrorData(e.response!.data);
    //   var errorCodes = [401, 409];
    //   if (errorCodes.contains(res.statusCode)) {
    //     return EasyLoading.showError(
    //       data['message'],
    //       duration: const Duration(seconds: 4),
    //       dismissOnTap: true,
    //     );
    //   }

    //   EasyLoading.showError(
    //     'Something went wrong! try again later',
    //     duration: const Duration(seconds: 2),
    //     dismissOnTap: true,
    //   );
    // }
  }
}
