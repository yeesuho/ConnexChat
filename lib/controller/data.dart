import 'package:connex_chat/data/model/chatrooms.dart';
import 'package:connex_chat/data/model/conversation.dart';
import 'package:connex_chat/data/model/employee.dart';
import 'package:connex_chat/data/model/unread_chat.dart';



class DataController {
  static final baseUrl = '10.0.2.2:3000';
  static final headers = {'Content-Type' : 'application/json'};

  static List<Employee> employee = [];
  static List<UnreadChat> unreadChat = [];
  static List<Conversation> conversation = [];
  static List<ChatroomList> chatroomList = [];
  static Me? me;
  static int totalCount = 0;
}