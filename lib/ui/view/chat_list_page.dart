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
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: [
                        Text("사내 전체 공지", style: TextStyle(fontSize: 18, color: Style.theme.colorScheme.primary, fontFamily: "LexendDeca-Bold", fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                        Text("개발팀", style: TextStyle(fontSize: 18, color: Colors.grey, fontFamily: "LexendDeca-Bold", fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(bottom: 10),
                      children: [
                        for(int i = 0; i < unreadChat.length; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                              child: Container(
                                height: 80,
                                width: double.infinity,
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
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(18, 10, 10, 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(unreadChat[i].room_name,style: TextStyle(fontFamily: "LexendDeca-Bold", fontSize: 20, fontWeight: FontWeight.bold),),
                                          Text(unreadChat[i].last_chat, style: TextStyle(fontSize: 16, fontFamily: "LexendDeca"),)
                                        ],
                                      ),
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
