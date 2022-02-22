import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;
  final String? token;
  final dynamic body;

  ApiRequest({
    required this.url,
    this.data,
    this.body,
    this.token,
  });

  Dio _dio() {
    return Dio(BaseOptions(
        headers: {'authToken': token, 'Content-Type': 'application/json'}));
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      final response = await _dio().get(url, queryParameters: data);
      if (onSuccess != null) onSuccess(response.data);
    } on DioError catch (error) {
      if (onError != null) onError(error);
      print(error.message);
    }

    // })
    // .catchError((error) {
    //   if (onError != null) onError(error);
    // });
  }

  void post({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      final response =
          await _dio().post(url, queryParameters: data, data: body);
      if (onSuccess != null) onSuccess(response.data);
    } on DioError catch (error) {
      if (onError != null) {
        onError(error);
        print(error.message);
      }
    }

    // .catchError((error) {
    //   if (onError != null) {
    //     onError(error);
    //     throw error;
    //   }
    // });
  }
}
