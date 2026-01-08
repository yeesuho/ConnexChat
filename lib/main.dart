import 'dart:convert';

import 'package:connex_chat/controller/app.dart';
import 'package:connex_chat/data/model/conversation.dart';
import 'package:connex_chat/data/model/employee.dart';
import 'package:connex_chat/data/model/unread_chat.dart';
import 'package:connex_chat/ui/style.dart';
import 'package:connex_chat/ui/view/chat_list_page.dart';
import 'package:connex_chat/ui/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'ui/view/home_page.dart';
import 'ui/view/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  App.employee = jsonDecode(await rootBundle.loadString("assets/data/사원_목록_data.json")).map<Employees>((e) => Employees.fromJson(e)).toList();
  App.unreadChat = jsonDecode(await rootBundle.loadString("assets/data/읽지_않은_대화_data.json")).map<UnreadChat>((e) => UnreadChat.fromJson(e)).toList();
  App.conversation = jsonDecode(await rootBundle.loadString("assets/data/채팅방_대화_내용_data.json")).map<Conversation>((e) => Conversation.fromJson(e)).toList();

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        // home: HomePage(),
        // home: LoginPage(),
        theme: Style.theme,
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  void initState() {
    App.tab = TabController(length: 3, animationDuration: Duration.zero, vsync: this);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
                controller: App.tab,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HomePage(), ChatListPage(), Container()
                ]
            ),
            // Positioned(left: 0, right: 0, bottom: -600 + 80,child: Transform.scale(
            //
            //   scaleX: 2.4,
            //   child: Container(
            //     width: 600,
            //     height: 600,
            //     color: Colors.white,
            //   ),
            // ),
            // ),
            Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsetsGeometry.fromLTRB(16,0,16,20),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Style.theme.colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5)
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: ValueListenableBuilder(
                    valueListenable: App.currentIndex,
                    builder: (context, value, child) {
                      return TabBar(
                          controller: App.tab,
                          indicator: BoxDecoration(),
                          // indicator: BoxDecoration(color: Style.theme.colorScheme.primary, shape: BoxShape.circle),
                          // indicatorColor: Style.theme.colorScheme.primary,
                          // indicatorColor: Style.theme.colorScheme.primary,
                          // indicatorSize: TabBarIndicatorSize.label,
                  
                          labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Style.theme.colorScheme.primary),
                          unselectedLabelStyle: TextStyle(color: Style.theme.colorScheme.primary),
                      
                          onTap: (value) => App.currentIndex.value = value,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          tabs: [
                            Tab(text: "Home",icon: Container(padding: EdgeInsets.only(top: 6), width: 34, height: 34, child: SvgPicture.asset(App.currentIndex.value == 0 ? "assets/icons/home-fill.svg":"assets/icons/home-outline.svg", color: Style.theme.colorScheme.primary, width: 24, height: 24 ))  ),
                            Tab(text: "Chat",icon: Container(padding: EdgeInsets.only(top: 6), width: 34, height: 34, child: SvgPicture.asset(App.currentIndex.value == 1 ? "assets/icons/chat-dots-fill.svg" : "assets/icons/chat-dots-outline.svg", color: Style.theme.colorScheme.primary, width: 24, height: 20 ))  ),
                            Tab(text: "Profile",icon: Container(padding: EdgeInsets.only(top: 6), width: 34, height: 34, child: SvgPicture.asset(App.currentIndex.value == 2 ? "assets/icons/person-fill.svg" : "assets/icons/person-outline.svg", color: Style.theme.colorScheme.primary, width: 24, height: 24 ))  ),
                          ]
                      );
                    }
                  ),
                ),
              ),),)
          ],
        ),
        // body: ,
      ),
    );
  }
}
