import 'dart:convert';

import 'package:dio/dio.dart';

class RequestHelper {
  static Future<dynamic> getRequest(String url) async {
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return 'failure';
      }
    } catch (e) {
      print('erro: ' + e.toString());
      return 'failure';
    }
  }
}
