import 'package:connex_chat/data/model/conversation.dart';
import 'package:connex_chat/data/model/employee.dart';
import 'package:connex_chat/data/model/unread_chat.dart';

class DataController {
  static final baseUrl = 'http://localhost:3000';
  static final headers = {'Content-Type' : 'aplication/json'};

  static List<Employee> employee = [];
  static List<UnreadChat> unreadChat = [];
  static List<Conversation> conversation = [];
}