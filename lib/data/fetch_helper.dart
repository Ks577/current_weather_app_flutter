import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../const/data_const.dart';
import 'package:http/http.dart' as http;

class FetchHelper {
  final String baseUrl;
  final String request;
  final String parameters;

  FetchHelper({
    this.baseUrl = Consts.baseUrl,
    this.request = Consts.getWeatherRequest,
    this.parameters = '',
  });

  Future<dynamic> getData() async {
    if (kDebugMode) {
      print('Request...');
    }
    final fullUrl =
        '$baseUrl$request?$parameters&appid=${Consts.myKey}&units=metric';
    http.Response response = await http.get(Uri.parse(fullUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (kDebugMode) {
        print('Response:\n$body');
      }

      return body;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }
}