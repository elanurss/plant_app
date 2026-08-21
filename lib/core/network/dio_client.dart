import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../error/app_exception.dart';
import 'api_constants.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

class DioClient {
  DioClient({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      responseType: ResponseType.json,
      headers: const {'Accept': 'application/json'},
      validateStatus: (status) =>
          status != null && status >= 200 && status < 300,
    );

    if (kDebugMode) {
      _dio.interceptors.add(LoggingInterceptor());
    }
    _dio.interceptors.add(ErrorInterceptor());
  }

  final Dio _dio;

  Future<Object> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      final data = response.data;
      if (data == null) {
        throw const ParsingException('Response body was empty.');
      }
      return _decodeIfNeeded(data);
    } on DioException catch (error) {
      throw _unwrap(error);
    }
  }

  Object _decodeIfNeeded(Object data) {
    if (data is! String) {
      return data;
    }

    try {
      return jsonDecode(data) as Object;
    } on FormatException {
      throw const ParsingException('Response body was not valid JSON.');
    }
  }

  AppException _unwrap(DioException error) {
    final wrapped = error.error;
    return wrapped is AppException ? wrapped : const UnknownException();
  }
}
