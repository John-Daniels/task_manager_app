import '../constants/api_constant.dart';
import '../models/response.dart';
import '../providers/api_provider.dart';
import '../utils/logger/app_logger.dart';

class TaskRepository {
  static getAllTasks({
    required Function(IResponse) onSuccess,
    Function(IResponse)? onErrorData,
  }) {
    catchError(
      callback: () async {
        var res = await ApiProvider.request.get(API.tasks);

        // AppLogger.i(res.data);
        onSuccess(IResponse.fromJson(res.data));
      },
      onErrorData: onErrorData,
    );
  }

  static createTask({
    required Map<String, dynamic> data,
    required Function(IResponse) onSuccess,
    Function(IResponse)? onErrorData,
  }) {
    catchError(
      callback: () async {
        var res = await ApiProvider.request.post(API.tasks, data: data);

        // AppLogger.i(res.data);
        onSuccess(IResponse.fromJson(res.data));
      },
      onErrorData: onErrorData,
    );
  }

  static updateTask({
    required String id,
    required Map<String, dynamic> data,
    required Function(IResponse) onSuccess,
    Function(IResponse)? onErrorData,
  }) {
    catchError(
      callback: () async {
        var res = await ApiProvider.request.put('${API.tasks}/$id', data: data);

        // AppLogger.i(res.data);
        onSuccess(IResponse.fromJson(res.data));
      },
      onErrorData: onErrorData,
    );
  }

  static deleteTask({
    required String id,
    required Function(IResponse) onSuccess,
    Function(IResponse)? onErrorData,
  }) {
    catchError(
      callback: () async {
        var res = await ApiProvider.request.delete('${API.tasks}/$id');

        // AppLogger.i(res.data);
        onSuccess(IResponse.fromJson(res.data));
      },
      onErrorData: onErrorData,
    );
  }
}
