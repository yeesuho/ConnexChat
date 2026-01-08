import 'package:connex_chat/controller/app.dart';
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
  List<Employee>? employee;
  List<UnreadChat> unreadChat = App.unreadChat.toList();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await EmployeeController.getEmployees();
    setState(() {
      employee = DataController.employee;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(employee!.length < 3) {
      return Scaffold(
        body: Container(
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
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  width: 40,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset("assets/icons/person-fill.svg",
                      width: 30, height: 30, color: Style.theme.colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text("Competitor1 님", style: TextStyle(color: Colors.white, fontFamily: "LexendDeca-Bold", fontSize: 20, fontWeight: FontWeight.bold),),
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
                    child: Text("읽지 않은 대화가 ${unreadChat.length}개 있어요!", style: TextStyle(
                      fontSize: 20, fontFamily: "LexendDeca-Bold", fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 140, child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    children: [
                      for(var i = 0; i < unreadChat.length; i++)
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
                                      child: ClipRRect(borderRadius: BorderRadius.circular(100) , child: Image.network("${employee![2].profileImage}", width: 40, height: 40,)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: ClipRRect(borderRadius: BorderRadius.circular(100) , child: Image.network("${employee![1].profileImage}", width: 40, height: 40,)),
                                    ),
                                    ClipRRect(borderRadius: BorderRadius.circular(100) , child: Image.network("${employee![0].profileImage}", width: 40, height: 40, fit: BoxFit.cover,)),
                                  ],
                                ),
                                SizedBox(height: 3,),
                                Text(unreadChat[i].room_name, style: TextStyle(fontSize: 18, color: Style.theme.colorScheme.primary, fontWeight: FontWeight.bold, fontFamily: "LexendDeca-Bold"),),
                                SizedBox(height: 5,),
                                Text(unreadChat[i].last_chat, style: TextStyle(fontSize: 14, fontFamily: "LexendDeca"), overflow: TextOverflow.ellipsis, maxLines: 1,)
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
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
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

