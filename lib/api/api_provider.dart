// Source:
// https://medium.com/flutter-community/handling-network-calls-like-a-pro-in-flutter-31bd30c86be1

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bigio_test/api/api.dart';
import 'package:bigio_test/utils/constants.dart' as AppConst;

class ApiProvider {
  final String _baseUrl = AppConst.API_URL;
  // Map<String, String> headers = {"Content-type": "application/json"};

  Future<dynamic> get(dynamic url, {Map<String, String>? headers}) async {
    var responseJson;
    try {
      final response =
          await http.get(Uri.parse(_baseUrl + url), headers: headers);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkException('Tidak ada koneksi internet');
    }
    return responseJson;
  }

  Future<dynamic> post(String url,
      {dynamic body, Map<String, String>? headers}) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url),
          body: body, headers: headers);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkException('Tidak ada koneksi internet');
    }
    return responseJson;
  }

  Future<dynamic> put(String url,
      {dynamic body, Map<String, String>? headers}) async {
    var responseJson;
    try {
      final response = await http.put(Uri.parse(_baseUrl + url),
          body: body, headers: headers);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkException('Tidak ada koneksi internet');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    var responseJson;
    try {
      final response =
          await http.delete(Uri.parse(_baseUrl + url), headers: headers);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkException('Tidak ada koneksi internet');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    if (kDebugMode) {
      String responseJsonStr = response.body;
      String endpointStr = response.request!.url.toString();
      String endpointMethod = response.request!.method;

      debugPrint('\x1B[31m\n->\x1B[0m');
      debugPrint('\x1B[37m[$endpointMethod] $endpointStr\x1B[0m');
      debugPrint('\x1B[33m$responseJsonStr\x1B[0m');
    }

    // return responseJson;

    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
