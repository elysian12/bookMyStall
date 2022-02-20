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
  }) {
    _dio().get(url, queryParameters: data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void post({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio().post(url, queryParameters: data, data: body).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
