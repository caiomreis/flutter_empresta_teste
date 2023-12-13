// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClient {
  Future getHttp(String url) async {
    try {
      Dio dio = Dio();
      return await dio.get(
        url,
      );
    } on DioError catch (e) {
      if (kDebugMode) {
        print(
            'Falha na requisição: $url; Erro: ${e.error}; Headers: ${e.requestOptions.headers['user-agent']}');
      }

      throw e.response!.data;
    }
  }

  Future postHttp(String url, dynamic data) async {
    try {
      Dio dio = Dio();
      return await dio.post(
        url,
        data: data,
      );
    } on DioError catch (e) {
      if (kDebugMode) {
        print(
            'Falha na requisição: $url; Erro: ${e.error}; Headers: ${e.requestOptions.headers['user-agent']}');
      }
      throw e.response!.data;
    }
  }
}
