import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plant_app/core/error/app_exception.dart';
import 'package:plant_app/core/network/dio_client.dart';

class _StubAdapter implements HttpClientAdapter {
  _StubAdapter(this.body);

  final String body;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return ResponseBody.fromString(
      body,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.textPlainContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

DioClient _clientReturning(String body) {
  return DioClient(dio: Dio()..httpClientAdapter = _StubAdapter(body));
}

void main() {
  // The live API answers with text/plain, so dio's default transformer hands
  // back a raw string instead of a decoded map.
  test('decodes a json body served as plain text', () async {
    final body = await _clientReturning('{"data":[]}').get('/getCategories');

    expect(body, isA<Map<String, dynamic>>());
  });

  test('reports malformed json as a parsing failure', () {
    expect(
      () => _clientReturning('not json').get('/getCategories'),
      throwsA(isA<ParsingException>()),
    );
  });
}
