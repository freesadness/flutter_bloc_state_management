import 'package:flutter/material.dart';
import 'package:flutter_bloc_state_management/src/models/jwt_request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DongeyApiProvider {
  http.Client client = http.Client();

  Future<String> fetchToken() async {
    final String url = "http://ec2-52-34-35-1.us-west-2.compute.amazonaws.com:8080/api/token-auth";
    final String email = "abc@hotmail.com";
    final String password = "123456";

    var map = JwtRequest(email: email, password: password).toJson();
    var response = await http.post(url, body: json.encode(map));

    debugPrint('${response.statusCode}');
    if (response.statusCode == 200) {
      debugPrint(response.body.toString());
      debugPrint(response.headers.toString());
      debugPrint(response.headers['authorization']);

      return response.headers['authorization'];
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to get token');
    }
  }
}
