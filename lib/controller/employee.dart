import 'dart:convert';
import 'dart:developer';

import 'package:connex_chat/controller/data.dart';
import 'package:connex_chat/data/model/employee.dart';
import 'package:http/http.dart';

class EmployeeController {
  static Future getEmployees() async{
    final response = await get(
      Uri.parse('http://${DataController.baseUrl}/employees'),
      headers: DataController.headers,
    );

    // log(jsonDecode(response.body)[0].toString());
    log(jsonDecode(response.body).toString());


    final decode = jsonDecode(response.body) as Map<String, dynamic>;
    final list = decode['data'] as List;
    

    DataController.employee = list.map((e) => Employee.fromJson(e as Map<String, dynamic>),).toList();
  }


  static Future getMe() async {
    final response = await get(
      Uri.parse('http://${DataController.baseUrl}/users/me'),
      headers: DataController.headers,
    );

    log("AUTH HEADER: ${DataController.headers['Authorization']}");
    final decode = jsonDecode(response.body) as Map<String, dynamic>;
    final data = decode['data'] as Map<String, dynamic>;

    DataController.me = Me.fromJson(data);


  }
}