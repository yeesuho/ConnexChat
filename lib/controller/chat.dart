import 'dart:convert';

import 'package:connex_chat/controller/data.dart';
import 'package:connex_chat/data/model/unread_chat.dart';
import 'package:http/http.dart';

class ChatController {
  static Future getUnreadChats() async {
    final response = await get(
      Uri.parse("http://${DataController.baseUrl}/messages/unread"),
      headers: DataController.headers,
    );

    final decode = jsonDecode(response.body)['data']['unreadChats'];
    final data = UnreadChat.fromJson(decode);

    DataController.unreadChat = data as List<UnreadChat>;

  }
}