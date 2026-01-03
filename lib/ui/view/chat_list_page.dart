import 'package:connex_chat/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.theme.colorScheme.primary,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 58),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Text("채팅방 목록", style: TextStyle(color: Colors.white, fontFamily: "LexendDeca-Bold", fontSize: 24, fontWeight: FontWeight.bold),),
                SvgPicture.asset("assets/icons/chat-plus-outline", width: 30, height: 30, color: Colors.white,),
                SizedBox(width: 10,),
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

            ),
          )
        ],
      ),
    );
  }
}
