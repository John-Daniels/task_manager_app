import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:task_manager/models/response.dart';
import 'package:task_manager/services/config_service.dart';
import 'package:task_manager/utils/logger/app_logger.dart';

import '../services/auth.dart';
import 'storage_provider.dart';

class ApiProvider {
  static Dio get request {
    var token = StorageProvider.get('token');

    final headers = {if (token != null) "Authorization": "Bearer $token"};

    var client = Dio(
      BaseOptions(
        baseUrl: Config.API_URL,
        headers: headers,
      ),
    );

    client.interceptors.add(InterceptorsWrapper(
      onError: (DioException error, handler) {
        if (error.response?.statusCode == 401 &&
            error.response?.data['message'] == 'Invalid token!') {
          // Redirect the user to the login screen
          // Get.offAllNamed(SigninView.routeName);
          AuthService.logout();
        }
        return handler.next(error);
      },
    ));

    return client;
  }
}

catchError({
  required Future Function() callback,
  Function(IResponse)? onErrorData,
}) async {
  try {
    await callback();
  } on DioException catch (e) {
    if (kDebugMode && e.response == null) AppLogger.e(e);
    if (e.response == null) {
      if (onErrorData != null) {
        return onErrorData(
          IResponse(status: 'error', message: e.message, data: null),
        );
      }

      EasyLoading.showError(
        'Something went wrong! try again later',
        duration: const Duration(seconds: 2),
        dismissOnTap: true,
      );
    }

    var res = e.response!;
    var data = res.data;
    if (res.statusCode == 401) {
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
