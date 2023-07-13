import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final dio = getDio();

const String protocol = "https";

Dio getDio(){
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 3),
    ),
  );
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
    client.badCertificateCallback=(X509Certificate cert, String host, int port){
      return true;
    };
    return null;
  };
  return dio;
}

setHeader(String key, String? value) {
  dio.options.headers[key] = value;
}

clearHeaders() {
  dio.options.headers.clear();
}