import 'dart:convert';
import 'package:doctor_bima/utils/extensions.dart';
import 'package:doctor_bima/webservice/base_request.dart';
import 'package:http/http.dart' as http;

mixin MockServer {
  Future<http.Response> mockApiCall(
      {String endpoint,
      bool authenticated,
      dynamic body,
      HttpMethod method,
      CallBackDelay callBackDelay =
          CallBackDelay.CALLBACK_DELAY_MEDIUM}) async {
    await Future.delayed(Duration(milliseconds: callBackDelay.delay));
    return http.Response(jsonEncode(body), 200);
  }
}

enum CallBackDelay {
  CALLBACK_DELAY_NONE,
  CALLBACK_DELAY_SHORT,
  CALLBACK_DELAY_MEDIUM,
  CALLBACK_DELAY_LONG
}
