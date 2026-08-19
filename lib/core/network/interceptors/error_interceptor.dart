import 'package:dio/dio.dart';

import '../../error/app_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        stackTrace: err.stackTrace,
        error: _toAppException(err),
      ),
    );
  }

  AppException _toAppException(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const RequestTimeoutException();
      case DioExceptionType.cancel:
        return const RequestCancelledException();
      case DioExceptionType.connectionError:
        return const NoInternetException();
      case DioExceptionType.badCertificate:
        return const UnknownException('Invalid server certificate.');
      case DioExceptionType.badResponse:
        return _fromStatusCode(err.response);
      case DioExceptionType.unknown:
        return const UnknownException();
    }
  }

  AppException _fromStatusCode(Response<dynamic>? response) {
    final code = response?.statusCode ?? 0;
    final reason = response?.statusMessage?.trim();

    return switch (code) {
      400 => BadRequestException(
        reason ?? 'The request was rejected.',
        statusCode: code,
      ),
      401 || 403 => UnauthorizedException(
        reason ?? 'You are not authorised for this resource.',
        statusCode: code,
      ),
      404 => NotFoundException(
        reason ?? 'The requested resource was not found.',
        statusCode: code,
      ),
      >= 500 && < 600 => ServerException(
        reason ?? 'The server is currently unavailable.',
        statusCode: code,
      ),
      _ => UnknownException(reason ?? 'Unexpected response ($code).'),
    };
  }
}
