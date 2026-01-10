import 'package:connex_chat/controller/auth.dart';
import 'package:connex_chat/main.dart';
import 'package:connex_chat/ui/style.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final key = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Style.theme.colorScheme.primary,
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(constraints: BoxConstraints(
              minHeight: constraints.maxHeight
            ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
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
                    const Spacer(),
                    SizedBox(height: 48,),
                    Container(
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
                                Form(
                                  key: key,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          TextFormField(
                                            textAlignVertical: TextAlignVertical.bottom,
                                            cursorHeight: 20,
                                            keyboardType: TextInputType.emailAddress,
                                            validator: (value) {
                                              if(value == null) return '알 수 없는 에러입니다.';
                                              if(!value.contains("@")) return '이메일을 입력해주세요.';
                                              if(value.contains(" ")) return '공백을 제외해주세요.';
                                              if(value.isEmpty) return '필수 입력값 입니다.';
                                              return null;
                                            },
                                            controller: email,


                                            style: TextStyle(
                                              // height: 3,
                                              height: 3,
                                              fontFamily: "LexendDeca",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                // labelText: "이메일을 입력해주세요.",
                                                labelStyle: TextStyle(color: Colors.grey[700], fontSize: 16),
                                                contentPadding: EdgeInsets.fromLTRB(10, 20, 20, 0),

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
                                          Padding(
                                            padding: EdgeInsets.only(left: 15, top: 10),
                                            child: Text("이메일을 입력해주세요.", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontFamily: "LexendDeca", fontSize: 14),)
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Stack(
                                        children: [
                                          TextFormField(
                                            textAlignVertical: TextAlignVertical.bottom,
                                            cursorHeight: 20,
                                            validator: (value) {
                                              if(value == null) return '알 수 없는 에러입니다.';
                                              if(value.length < 4) return '비밀번호는 4자 이상 입력해주세요.';
                                              if(value.isEmpty) return '필수 입력값 입니다.';
                                              return null;
                                            },
                                            controller: password,
                                            obscureText: true,
                                            style: TextStyle(
                                                height: 3,
                                                color: Colors.black,
                                                fontFamily: "LexendDeca",
                                                fontWeight: FontWeight.bold
                                            ),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                // labelText: "비밀번호를 입력해주세요.",
                                                labelStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
                                                contentPadding: EdgeInsets.fromLTRB(10, 20, 20, 0),
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
                                          Padding(

                                            padding: EdgeInsets.only(top: 10, left: 15),
                                            child: Text("비밀번호를 입력해주세요.", style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "LexendDecda"),))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 220,),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      child: OutlinedButton(
                                        onPressed: () async{
                                          if(key.currentState!.validate()) {
                                            final result = await AuthController.login(email.text, password.text);
                                            if(result == true) {
                                              // ScaffoldMessenger.of(context).showSnackBar(
                                              //   SnackBar(content: Text('환영합니다.')),
                                              // );
                                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyApp(),), (route) => false,);
                                            } else {
                                              email.clear();
                                              password.clear();
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('아이디 또는 비밀번호를 확인해주세요.')),
                                              );
                                            }
                                          }

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
                  ],
                ),
              ),
            ),

          );
        },),
      ),
    );

  }
}
