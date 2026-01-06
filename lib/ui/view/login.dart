import 'package:connex_chat/main.dart';
import 'package:connex_chat/ui/style.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Style.theme.colorScheme.primary,
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Row(
                        children: [
                          Image.asset("assets/simbol/simbol-white.png"),
                          SizedBox(width: 10,),
                          Text("Connex Chat", style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: "LexendDeca-Bold", fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    Text("안녕하세요!", style: TextStyle(color: Colors.white, fontSize: 40, fontFamily: "LexendDeca-Bold", fontWeight: FontWeight.bold),),
                    Text("Connex Chat과 함께 오늘도 활기찬 하루되세요", style: TextStyle(fontSize: 16, fontFamily: "LexendDeca", color: Colors.white, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Align(
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
                              Column(
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
                                          color: Colors.grey,
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
                                    obscureText: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "비밀번호를 입력해주세요.",
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
                                  )
                                ],
                              ),
                              SizedBox(height: 220,),
                              Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: OutlinedButton(
                                      onPressed: (){
                                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyApp(),), (route) => false,);
                                      },
                                      style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        color: Style.theme.colorScheme.primary,
                                        width: 2
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusGeometry.circular(14),
                                      )
                                    ), child: Text("로그인 하기",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "LexendDeca-Bold"),),),
                                  ),
                                  SizedBox(height: 10,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: ElevatedButton(onPressed: (){
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => AlertDialog(
                                          content: Padding(padding: EdgeInsets.only(top: 20, left: 20), child: Text("기능을 준비 중 입니다!", style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "LexendDeca"))),
                                          actions: [
                                            TextButton(onPressed: (){
                                              Navigator.of(context).pop();
                                            }, child: Text("확인", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "LexendDeca"),))
                                          ],
                                        ),
                                      );
                                    }, style: ElevatedButton.styleFrom(
                                        backgroundColor: Style.theme.colorScheme.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14)
                                      )
                                    ) , child: Text("회원가입 하러가기", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "LexendDeca-Bold"),)),
                                  )
                                ],
                              )
                            ],
                          ),

                        ),
                      ],


                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
