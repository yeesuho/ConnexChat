import 'package:connex_chat/controller/app.dart';
import 'package:connex_chat/data/model/unread_chat.dart';
import 'package:connex_chat/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<UnreadChat> unreadChat = App.unreadChat.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.theme.colorScheme.primary,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 58),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("채팅방 목록", style: TextStyle(color: Colors.white, fontFamily: "LexendDeca-Bold", fontSize: 24, fontWeight: FontWeight.bold),),
                GestureDetector(onTap: (){

                } ,child: SvgPicture.asset("assets/icons/chat-plus-outline.svg", width: 30, height: 30, color: Colors.white,)),

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height/1.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50))
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("사내 전체 공지"),
                      Text("개발팀"),
                    ],
                  ),
                  Expanded(
                    child: ListView(

                      children: [
                        for(int i = 0; i < unreadChat.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Style.theme.colorScheme.primary.withValues(alpha: 0.3),
                                        blurRadius: 7,
                                        spreadRadius: 2,
                                        offset: Offset(0, 3)
                                    )
                                  ]
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(unreadChat[i].room_name,style: TextStyle(fontFamily: "LexendDeca-Bold", fontSize: 20, fontWeight: FontWeight.bold),),
                                        Text(unreadChat[i].last_chat, style: TextStyle(fontSize: 16, fontFamily: "LexendDeca"),)
                                      ],
                                    ),
                                    Text("오후 10:21", style: TextStyle(fontSize: 16, fontFamily: "LexendDeca"))
                                  ],
                                ),
                              ),
                            )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
