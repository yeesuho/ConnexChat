import 'package:connex_chat/controller/app.dart';
import 'package:connex_chat/data/model/conversation.dart';
import 'package:connex_chat/ui/style.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});



  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Conversation> conversation = App.conversation.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.theme.colorScheme.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios_rounded)),
        
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height/1.15,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: ListView(
                        padding: EdgeInsets.only(bottom: 80),
                        children: [
                          for (var i = 0; i < conversation.length; i ++)
                            if (conversation[i].check == "타인")
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset("assets/img/${conversation[i].profile}.jpg", fit: BoxFit.cover, width: 35, height: 35,)),
                                      SizedBox(width: 10,),
                                      Text(conversation[i].name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "LexendDeca"),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                      color: Color(0xfff7f4ff)
                                    ),
                                    child: Text(conversation[i].talk, style: TextStyle(fontSize: 14, fontFamily: "LexendDeca-Bold", fontWeight: FontWeight.w500),),
                                  ),
                                  Text(conversation[i].time, textAlign: TextAlign.left, style: TextStyle(fontSize: 12, fontFamily: "LexendDeca"),),
                                  SizedBox(height: 20,),
                                ],
                              )
                            else
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    // width: ,
                                    padding: EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topLeft: Radius.circular(15)),
                                      color: Style.theme.colorScheme.primary
                                    ),
                                      child: Text(
                                        conversation[i].talk,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "LexendDeca-Bold",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                        ),
                                      )
                                  ),
                                  Text(conversation[i].time, textAlign: TextAlign.right, style: TextStyle(fontSize: 12, fontFamily: "LexendDeca"),),
                                  SizedBox(height: 20,)
                                ],
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,

            child: Container(
              height: MediaQuery.of(context).size.height/9,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                        blurRadius: 3,
                        color: Colors.black.withValues(alpha: .1),
                        offset: Offset(0, -1)
                    )
                  ],
                color: Colors.white
              ),
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            bottom: 25,
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "대화 내용 입력...",
                  labelStyle: TextStyle(color: Colors.grey[600], fontSize: 16),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2
                    )
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Style.theme.colorScheme.primary,
                      width: 2
                    )
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
