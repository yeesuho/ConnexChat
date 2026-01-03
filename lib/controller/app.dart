import 'package:connex_chat/data/model/employee.dart';
import 'package:connex_chat/data/model/unread_chat.dart';
import 'package:flutter/material.dart';

class App {
  static late TabController tab;

  static ValueNotifier<int> currentIndex = ValueNotifier(0);

  static List<Employee> employee = [];
  static List<UnreadChat> unreadChat = [];

}