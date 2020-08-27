import 'dart:convert';
import 'dart:io';
import 'api_service.dart';
import 'package:http/http.dart' as http;
import 'exceptions.dart';
import 'package:flutter/material.dart';

class ApiClient {
  ApiService _apiService = ApiService();

  getNewsResponse(String value) async {
    String endpoint = "";
    String url = _apiService.apiKey +
        _apiService.query +
        "&" +
        _apiService.limit +
        "&" +
        endpoint +
        "&" +
        _apiService.apiKey;
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      if (json['status'] == "ok") {
        return json;
      } else if (json['status'] == "error") {
        throw FetchDataException(json['code'] + json['message']);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}

enum StateLocation { GLOBAL, SPECIFIC, ALL, TOP_FIVE }
