import 'package:connex_chat/controller/app.dart';
import 'package:connex_chat/data/model/employee.dart';
import 'package:connex_chat/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> employee= App.employee.toList();

  @override
  Widget build(BuildContext context) {
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
                  Padding(padding: EdgeInsets.only(left: 30, top: 40),
                    child: Text("사원 목록", style: TextStyle(fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "LexendDeca-Bold"),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(top: 20, bottom: MediaQuery.of(context).size.height/10),
                      children: [
                        for(var i = 0; i < employee.length; i += 1)
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
                            child: Row(
                              children: [
                                 Stack(children: [
                                   ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset("assets/img/${employee[i].profile}.jpg", width: 60, height: 60, fit: BoxFit.cover,)),
                                   Positioned.fill(child: Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       gradient: LinearGradient(begin: Alignment(.5, 0), end: Alignment.centerRight, colors: [Colors.white.withValues(alpha: .05), Colors.white])
                                     ),
                                   ))
                                 ]),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(employee[i].name, style: TextStyle(fontFamily: "LexendDeca", fontSize: 16, fontWeight: FontWeight.w500),),
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

