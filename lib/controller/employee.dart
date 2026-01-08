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


    final decode = jsonDecode(response.body) as List;

    // final List list = (decode is List) ? decode : (decode['data'] as List);

    // DataController.employee = jsonDecode(
    //   response.body,
    // )[0];

    DataController.employee = decode.map((e) => Employee.fromJson(e),).toList();
  }
}