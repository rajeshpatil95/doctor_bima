import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doctor_bima/flavour/flavour_variables.dart';
import 'package:doctor_bima/native/platform_utils.dart';
import 'package:doctor_bima/utils/mock_server.dart';
import 'package:package_info/package_info.dart';
import 'package:uuid/uuid.dart';

abstract class BaseRequest with MockServer {
  bool authenticated;
  String url;
  HttpMethod method;
  dynamic body;
  Map<String, String> headers;

  // TODO Query Params

  Future<http.Response> constructAndExecuteRequest(
      {HttpMethod method,
      String endpoint,
      bool authenticated,
      dynamic body}) async {
    await constructRequest(
        method: method,
        endpoint: endpoint,
        authenticated: authenticated,
        body: body);
    return await executeRequest();
  }

  constructRequest(
      {HttpMethod method,
      String endpoint,
      bool authenticated,
      dynamic body}) async {
    this.method = method;
    this.url = await getBaseUrl() + endpoint;
    this.authenticated = authenticated;
    this.body = body;
    await setRequestHeaders();
  }

  executeRequest() async {
    switch (method) {
      case HttpMethod.get:
        return http.get(url, headers: headers);
      case HttpMethod.post:
        return http.post(url, headers: headers, body: body);
      case HttpMethod.put:
        return http.put(url, headers: headers, body: body);
      case HttpMethod.delete:
        return http.delete(url, headers: headers);
    }
  }

  setRequestHeaders() async {
    PackageInfo packageInfo = await PlatformUtils.getPackageInfo();
    headers = new Map();
    if (authenticated) {
      headers["Authorization"] = "Bearer " + "61f58cc1-7c01-4e5c-8b52-4a73b7cec98d";
    }
    headers["application-id"] = 'moneytap';
    headers["app-version"] = packageInfo.version;
    headers["app-versionCode"] = packageInfo.buildNumber;
    headers["app-platform"] = "money-tap-android-app";
    headers["device-id"] = "";
    headers["mt-request-id"] = Uuid().v4();
    headers["mt-partner-code"] = 'moneytap';
    headers["Content-Type"] = 'application/json';
  }

  Future<String> getBaseUrl() async {
    return getFlavourVariable(FlavourVariable.baseUrl);
  }
}

enum HttpMethod { get, post, put, delete }
