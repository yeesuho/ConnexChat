import 'dart:convert';
import 'dart:developer';

import 'package:connex_chat/controller/data.dart';
import 'package:connex_chat/data/model/chatrooms.dart';
import 'package:connex_chat/data/model/conversation.dart';
import 'package:connex_chat/data/model/unread_chat.dart';
import 'package:http/http.dart';

class ChatController {
  static Future getUnreadChats() async {
    final response = await get(
      Uri.parse("http://${DataController.baseUrl}/messages/unread"),
      headers: DataController.headers,
    );

    log(jsonDecode(response.body)['data']['totalCount'].toString());

    final decode = jsonDecode(response.body);

    final unreadChatCount = decode['data']['totalCount'];

    final list = (decode['data']?['unreadChats'] as List? ?? []);
    final data = list.map((e) => UnreadChat.fromJson(e as Map<String, dynamic>)).toList();

    DataController.unreadChat = data;
    DataController.totalCount = unreadChatCount;
  }

  static Future getChatRooms() async {
    final response = await get(
      Uri.parse("http://${DataController.baseUrl}/chatrooms?includeFavorites=true"),
      headers: DataController.headers,
    );



    final decode = jsonDecode(response.body);

    final chatroomList = decode['data']['chatrooms'] as List;
    final data = chatroomList.map((e)=> ChatroomList.fromJson(e as Map<String, dynamic>)).toList();

    log(chatroomList.toString());


    DataController.chatroomList = data;
  }


  static Future getConversation() async {
    final response = await get(
      Uri.parse("http://${DataController.baseUrl}/chatrooms/1/messages"),
      headers: DataController.headers,
    );

    final decode = jsonDecode(response.body);

    final conversation = decode['data']['messages'] as List;
    final data = conversation.map((e) => Conversation.fromJson(e as Map<String, dynamic>)).toList();

    DataController.conversation = data;
  }
}