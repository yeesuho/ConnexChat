import 'package:connex_chat/controller/app.dart';
import 'package:connex_chat/data/model/employee.dart';
import 'package:connex_chat/data/model/unread_chat.dart';
import 'package:connex_chat/ui/style.dart';
import 'package:connex_chat/ui/view/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<UnreadChat> unreadChat = App.unreadChat.toList();
  List<Employee> employee = App.employee.toList();

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
                  showDialog(context: context, barrierDismissible: true, builder: (context) {
                    return Dialog(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("채팅방 생성하기"),
                                IconButton(onPressed: (){
                                  Navigator.pop(context);
                                }, icon: Icon(Icons.close))
                              ],
                            )
                          ],
                        ),
                      ),);
                  },);
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
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPage(),));
                                },
                                onLongPress: () {
                                  showDialog(context: context, barrierDismissible: true,builder: (context) {

                                    return Dialog(shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(unreadChat[i].room_name,style: TextStyle(fontFamily: "LexendDeca-Bold", fontSize: 20, fontWeight: FontWeight.bold),),
                                                IconButton(onPressed: () {
                                                  Navigator.pop(context);
                                                }, icon: Icon(Icons.close))
                                              ],
                                            ),
                                            ListTile(
                                              title: Text("채팅방 정보 수정"),
                                              onTap: () {
                                                Navigator.pop(context);
                                                Set<int> selectedEmployee = {};

                                                showDialog(context: context, barrierDismissible: true, builder: (context) {
                                                  return StatefulBuilder(
                                                    builder:(context, setState) =>  Dialog(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(20.0),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text("채팅방 수정하기",style: TextStyle(fontFamily: "LexendDeca-Bold", fontSize: 20, fontWeight: FontWeight.bold),),
                                                                IconButton(onPressed: () {
                                                                  Navigator.pop(context);
                                                                }, icon: Icon(Icons.close))
                                                              ],
                                                            ),
                                                            SizedBox(height: 20,),
                                                            TextField(
                                                              decoration: InputDecoration(
                                                                labelText: "섹션 이름을 입력해주세요",
                                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                                                              ),
                                                            ),
                                                            TextField(
                                                              decoration: InputDecoration(
                                                                  labelText: "채팅방 이름을 입력해주세요",
                                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                                                              ),
                                                            ),
                                                            SizedBox(height: 20,),
                                                            SizedBox(
                                                              height: 60,
                                                              child: ListView(
                                                                scrollDirection: Axis.horizontal,

                                                                children: [
                                                                  for(var i = 0; i < employee.length; i++)
                                                                    Padding(
                                                                      padding: EdgeInsets.only(right: 12),
                                                                      child: GestureDetector(
                                                                        onTap: () {
                                                                          setState(() {
                                                                            if (selectedEmployee.contains(i)) {
                                                                              selectedEmployee.remove(i);
                                                                            } else {
                                                                              selectedEmployee.add(i);
                                                                            }
                                                                          });
                                                                        },
                                                                        child: Opacity(
                                                                          opacity: selectedEmployee.contains(i) ? 1.0 : 0.3,
                                                                          child: Row(
                                                                            children: [
                                                                              ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset("assets/img/${employee[i].profile}.jpg", fit: BoxFit.cover, width: 40, height: 40,)),
                                                                              SizedBox(width: 10,),
                                                                              Text(employee[i].name, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "LexendDeca", fontSize: 16),),
                                                                              SizedBox(width: 12,),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(height: 20,),
                                                            OutlinedButton(style: OutlinedButton.styleFrom(
                                                              minimumSize: Size(100, 60),
                                                              backgroundColor: Style.theme.colorScheme.primary,
                                                              foregroundColor: Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadiusGeometry.circular(10)
                                                              ),

                                                            ),onPressed: () {
                                                              Navigator.pop(context);
                                                              print("정보 수정");
                                                            }, child: Text("수정하기", style: TextStyle(fontSize: 16, fontFamily: "LexendDeca", fontWeight: FontWeight.bold),))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },);
                                              },
                                            ),
                                            ListTile(
                                              title: Text("나가기"),
                                              onTap: () {
                                                Navigator.pop(context);
                                                print("나가기 클릭");
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },);
                                },
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(18, 10, 10, 10),
                                        child: SizedBox(
                                          width: 220,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(unreadChat[i].room_name,style: TextStyle(fontFamily: "LexendDeca-Bold", fontSize: 20, fontWeight: FontWeight.bold),),
                                              Text(unreadChat[i].last_chat, style: TextStyle(fontSize: 16, fontFamily: "LexendDeca"), overflow: TextOverflow.ellipsis, maxLines: 1,)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text("오후 10:21", style: TextStyle(fontSize: 16, fontFamily: "LexendDeca")),
                                      SizedBox(width: 10,)
                                    ],
                                  ),
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
