import 'package:context_chat/ui/style.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.theme.colorScheme.primary,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)), color: Colors.white),
          height: MediaQuery.of(context).size.height/1.4,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(35, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Login", style: TextStyle(color: Style.theme.colorScheme.primary, fontSize: 34, fontWeight: FontWeight.bold, fontFamily: "LexendDeca-Bold"),)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "이메일을 입력해주세요.",
                        labelStyle: TextStyle(color: Colors.grey[700], fontSize: 16),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Style.theme.colorScheme.primary,
                            width: 2.0
                          )
                        ),
                          
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Style.theme.colorScheme.primary,
                            width: 2.0
                          )
                        )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "비밀번호를 입력해주세요.",
                        labelStyle: TextStyle(color: Colors.grey[600], fontSize: 16),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Style.theme.colorScheme.primary,
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
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
