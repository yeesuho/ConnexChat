import 'package:context_chat/ui/style.dart';
import 'package:context_chat/ui/view/login.dart';
import 'package:flutter/material.dart';

import 'ui/view/home_page.dart';
import 'ui/view/splash_page.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SplashPage(),
        // home: HomePage(),
        home: LoginPage(),
        theme: Style.theme,
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      // body: ,
    );
  }
}
