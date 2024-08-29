import 'package:task_manager/models/response.dart';
import 'package:task_manager/utils/logger/app_logger.dart';

import '../constants/api_constant.dart';
import '../providers/api_provider.dart';

class UserRepository {
  static getUserProfile({
    required Function(IResponse) onSuccess,
    Function(IResponse)? onErrorData,
  }) {
    catchError(
        callback: () async {
          var res = await ApiProvider.request.get(API.profile);

          AppLogger.i(res.data);
          onSuccess(IResponse.fromJson(res.data));
        },
        onErrorData: onErrorData);
  }
}
