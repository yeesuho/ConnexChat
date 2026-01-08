import 'dart:convert';
import 'dart:developer';

import 'package:connex_chat/controller/data.dart';
import 'package:http/http.dart';

class AuthController {
  static Future<bool> login(email, password) async {
    final response = await post(
      Uri.parse('http://${DataController.baseUrl}/auth/login'),
      headers: DataController.headers,
      body: jsonEncode({"email": email, "password" : password}),
    );

    log(jsonDecode(response.body).toString());

    if(response.statusCode == 200) {
      final token = jsonDecode(response.body)['access_token'];
      DataController.headers['Authorization'] = 'Bearer $token';
    }

    return response.statusCode == 200;
  }
}