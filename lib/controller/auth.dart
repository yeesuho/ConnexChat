import 'dart:convert';
import 'dart:developer';

import 'package:connex_chat/controller/data.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static Future<bool> login(email, password) async {
    final response = await post(
      Uri.parse('http://${DataController.baseUrl}/auth/login'),
      headers: DataController.headers,
      body: jsonEncode({"email": email, "password" : password}),
    );

    log(jsonDecode(response.body).toString());

    if(response.statusCode == 200) {
      final token = jsonDecode(response.body)['data']['token'];
      final prefs = await SharedPreferences.getInstance();

      DataController.headers['Authorization'] = 'Bearer $token';
      await prefs.setString('token', DataController.headers['Authorization']!);

    }

    return response.statusCode == 200;
  }
}