sealed class AppException implements Exception {
  const AppException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => '$runtimeType(${statusCode ?? '-'}): $message';
}

final class NoInternetException extends AppException {
  const NoInternetException([super.message = 'No internet connection.']);
}

final class RequestTimeoutException extends AppException {
  const RequestTimeoutException([super.message = 'The request timed out.']);
}

final class RequestCancelledException extends AppException {
  const RequestCancelledException([super.message = 'Request was cancelled.']);
}

final class BadRequestException extends AppException {
  const BadRequestException(super.message, {super.statusCode});
}

final class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message, {super.statusCode});
}

final class NotFoundException extends AppException {
  const NotFoundException(super.message, {super.statusCode});
}

final class ServerException extends AppException {
  const ServerException(super.message, {super.statusCode});
}

final class ParsingException extends AppException {
  const ParsingException([super.message = 'Received malformed data.']);
}

final class UnknownException extends AppException {
  const UnknownException([super.message = 'Something went wrong.']);
}
