import 'package:connex_chat/controller/app.dart';
import 'package:connex_chat/controller/chat.dart';
import 'package:connex_chat/controller/data.dart';
import 'package:connex_chat/controller/employee.dart';
import 'package:connex_chat/data/model/employee.dart';
import 'package:connex_chat/data/model/unread_chat.dart';
import 'package:connex_chat/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee>? employee = DataController.employee;
  List<UnreadChat>? unreadChat = DataController.unreadChat;
  Me? me = DataController.me;
  static bool isLoading = true;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await EmployeeController.getEmployees();
    await EmployeeController.getMe();
    await ChatController.getUnreadChats();
    setState(() {
      employee = DataController.employee;
      me = DataController.me;
      unreadChat = DataController.unreadChat;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Style.theme.colorScheme.primary,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 54),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network("${me!.profileImage}", width: 40, height: 40, fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10,),
                Text(me!.name, style: TextStyle(color: Colors.white, fontFamily: "LexendDeca-Bold", fontSize: 20, fontWeight: FontWeight.bold),),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 26, top: 40),
                    child: Text("읽지 않은 대화가 ${unreadChat!.length}개 있어요!", style: TextStyle(
                      fontSize: 20, fontFamily: "LexendDeca-Bold", fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 140, child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    children: [
                      for(var i = 0; i < unreadChat!.length; i++)
                        Container(
                          margin: EdgeInsets.only(left: 14),
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 4)
                              ),
                            ]
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(12, 12, 10, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 40),
                                      child: ClipRRect(borderRadius: BorderRadius.circular(100) , child: Image.network("${unreadChat![i].participants[0].profileImage}", width: 40, height: 40,)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: ClipRRect(borderRadius: BorderRadius.circular(100) , child: Image.network("${unreadChat![i].participants[1].profileImage}", width: 40, height: 40,)),
                                    ),
                                    ClipRRect(borderRadius: BorderRadius.circular(100) , child: Image.network("${unreadChat![i].participants[2].profileImage}", width: 40, height: 40, fit: BoxFit.cover,)),
                                  ],
                                ),
                                SizedBox(height: 3,),
                                Text(unreadChat![i].roomName, style: TextStyle(fontSize: 18, color: Style.theme.colorScheme.primary, fontWeight: FontWeight.bold, fontFamily: "LexendDeca-Bold"),),
                                SizedBox(height: 5,),
                                Text(unreadChat![i].lastMessage, style: TextStyle(fontSize: 14, fontFamily: "LexendDeca"), overflow: TextOverflow.ellipsis, maxLines: 1,)
                              ],
                            ),
                          ),

                        )

                    ],
                  )),
                  SizedBox(height: 20,),
                  Padding(padding: EdgeInsets.only(left: 26),
                    child: Text("사원 목록", style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "LexendDeca-Bold"),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(top: 20, bottom: MediaQuery.of(context).size.height/10),
                      children: [
                        for(var i = 0; i < employee!.length; i += 1)
                          Container(

                            padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                            child: Row(
                              children: [
                                 Stack(children: [
                                   ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network("${employee![i].profileImage}", width: 60, height: 60, fit: BoxFit.cover,)),
                                   Positioned.fill(child: Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       gradient: LinearGradient(begin: Alignment(.5, 0), end: Alignment.centerRight, colors: [Colors.white.withValues(alpha: .05), Colors.white])
                                     ),
                                   ))
                                 ]),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(employee![i].name, style: TextStyle(fontFamily: "LexendDeca", fontSize: 16, fontWeight: FontWeight.w500),),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

