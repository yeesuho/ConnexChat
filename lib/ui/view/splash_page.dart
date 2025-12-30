import 'dart:math' as math;

import 'package:context_chat/ui/style.dart';
import 'package:context_chat/ui/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController ac = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 3500),
  );

  late AnimationController bounceController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
  // late CurvedAnimation animation = CurvedAnimation(
  //   parent: ac,
  //   curve: Curves.easeOutCirc,
  // );
  late Animation<double> logoRotationAnimation;
  // late final Animation<double> handleIn = CurvedAnimation(parent: ac, curve: Interval(0.0, 0.4, curve: Curves.easeOut));
  // late final Animation<double> arrowsIn = CurvedAnimation(parent: ac, curve: Interval(0.4, 0.8, curve: Curves.easeOut));

  late final Animation<double> sliderHandleAnimation;
  late final Animation<double> sliderBGAnimation;


  ValueNotifier<double> progress = ValueNotifier(0);

  bool showFullSlider = false;

  Success() {
    Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
        // transitionDuration: Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => Transform.translate(offset: Offset(0, 500 - 500 * animation.value), child: Opacity(opacity: animation.value, child: child,),)
    ), (route) => route.isFirst);
  }

  @override
  void initState() {
    super.initState();
    logoRotationAnimation = Tween<double>(begin: 0.5, end: 0.0).animate(CurvedAnimation(parent: ac, curve: Interval(0.0, 0.3, curve: Curves.easeOutBack),));
    sliderHandleAnimation = CurvedAnimation(parent: ac, curve: Interval(0.6, 0.8, curve: Curves.easeOut));
    sliderBGAnimation = CurvedAnimation(parent: ac, curve: Interval(0.9, 1.0, curve: Curves.easeOut));
    Future.delayed(Duration(milliseconds: 1000), () => ac.forward());
    // Future.delayed(Duration(seconds: 1), () {
    //   if(mounted) setState(() => showFullSlider = true);
    // });
    Future.delayed(Duration(milliseconds: 2000), () {
      if(mounted) bounceController.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    ac.dispose();
    bounceController.dispose();
    super.dispose();
  }

  List<Widget> _buildAnimatedText(String text) {
    List<Widget> letters = [];
    for (int i = 0; i < text.length; i++) {

      // 각 글자가 나타나는 타이밍 계산
      // 전체 애니메이션 시간(0.0 ~ 1.0) 안에서 각 글자의 시작/ 끝지점 정함
      double start = (i * 0.05).clamp(0.0, 1.0);
      double end = (start + 0.2).clamp(0.0, 1.0);

      var charAnimation = CurvedAnimation(
        parent: ac,
        curve: Interval(start, end, curve: Curves.easeOut),

      );


      letters.add(
        AnimatedBuilder(animation: charAnimation, builder: (context, child) {
          return Opacity(
            opacity: charAnimation.value,
            child: Text(text[i], style: TextStyle(color: Colors.white, fontFamily: "LexendDeca", fontSize: 34, fontWeight: FontWeight.bold),),
          );
        },)
      );
    }
    return letters;
  }

  @override
  Widget build(BuildContext context) {
    var subTextAnimation = CurvedAnimation(parent: ac, curve: Interval(0.3, 0.65, curve: Curves.easeOut));

    return SafeArea(
      top: false,
      child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    color: Style.theme.primaryColor,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        AnimatedBuilder(
                          animation: ac, builder: (context, child) => Transform.translate(
                            offset: Offset(0, 0),
                            child: Opacity(
                              opacity: ac.value,
                              child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RotationTransition(turns: logoRotationAnimation, child: Image.asset("assets/simbol/simbol-white.png", width: 50, height: 50,),),
                                  SizedBox(width: 10,),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children:
                                    _buildAnimatedText("Context Chat"),

                                  )

                                ],
                              ),
                                                      ),
                            ),
                          ),

                        ),
                        AnimatedBuilder(animation: subTextAnimation, builder: (context, child) => Transform.translate(
                          offset: Offset(0, 20 * (1 - subTextAnimation.value)),
                          child: Opacity(opacity:subTextAnimation.value, child: Text(
                            "언제 어디서든 안정적인 근무 환경을 위해",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),)),
                        ),),
                      ],
                    ),
                  ),

                  // Align(alignment: AlignmentGeometry.bottomCenter, child: Container(
                  //   margin: EdgeInsets.only(bottom: 100),
                  //   width: 84, height: 190,
                  //   padding: EdgeInsets.all(4),
                  //   decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: AlignmentGeometry.center, colors: [Colors.transparent, Colors.white.withValues(alpha: .25)]), borderRadius: BorderRadius.circular(100)),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Column(
                  //         children: [
                  //           SizedBox(height: 40,),
                  //           ValueListenableBuilder(valueListenable: progress, builder: (context, value, child) => Opacity(opacity: 1 - progress.value, child: Transform.rotate(angle: math.pi / 2, child: SvgPicture.asset("assets/icons/back.svg", color: Colors.white.withValues(alpha: .6), width: 20 ,)),),),
                  //           ValueListenableBuilder(valueListenable: progress, builder: (context, value, child) => Opacity(opacity: 1 - progress.value, child: Transform.rotate(angle: math.pi / 2, child: SvgPicture.asset("assets/icons/back.svg", color: Colors.white, width: 20)),),),
                  //         ],
                  //       ),
                  //       Dismissible(
                  //         key: UniqueKey(),
                  //         direction: DismissDirection.up,
                  //         onDismissed: (direction) => Success(),
                  //         onUpdate: (details) => progress.value = details.progress,
                  //         child: CircleAvatar(radius: 40, backgroundColor: Colors.white, child: Text("NEXT", style: TextStyle(color: Style.theme.colorScheme.primary, fontFamily: "LexendDeca", fontWeight: FontWeight.bold, fontSize: 20),),),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),
                  // ),


                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedBuilder(animation: ac, builder: (context, child) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 100),
                        width: 84,
                        height: 180,
                        padding: EdgeInsets.all(4),

                        decoration: BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.center, colors: [
                            Colors.transparent,
                            Colors.white.withValues(alpha: 0.25 * sliderBGAnimation.value)
                          ]),
                          borderRadius: BorderRadius.circular(100)
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 30,),
                            Opacity(opacity: sliderBGAnimation.value, child: Column(
                              children: [
                                ValueListenableBuilder(valueListenable: progress, builder: (context, value, child) => Opacity(
                                    opacity: 1 - progress.value, child: Transform.rotate(
                                    angle: math.pi / 2,
                                  child: SvgPicture.asset("assets/icons/back.svg", color: Colors.white.withValues(alpha: .6), width: 20,),
                                ),
                                ),),
                                ValueListenableBuilder(valueListenable: progress, builder: (context, value, child) => Opacity(
                                  opacity: 1 - progress.value, child: Transform.rotate(
                                  angle: math.pi / 2,
                                  child: SvgPicture.asset("assets/icons/back.svg", color: Colors.white, width: 20,),),),)
                              ],
                            ),),
                            Transform.scale(
                              scale: sliderHandleAnimation.value,
                              child: Opacity(opacity: sliderHandleAnimation.value, child: AnimatedBuilder(
                                animation: bounceController,
                                builder: (context, child) {
                                  return Transform.translate(offset: Offset(0, -10 * bounceController.value), child: child,);
                                },
                                child: Dismissible(
                                    key: UniqueKey(),
                                  direction: DismissDirection.up,
                                  onDismissed: (direction) => Success(),
                                  onUpdate: (details) => progress.value = details.progress,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    child: Text("NEXT", style: TextStyle(color: Style.theme.colorScheme.primary, fontFamily: "LexendDeca", fontWeight: FontWeight.bold, fontSize: 20),),
                                  ),
                                ),
                              ),),
                            )
                          ],
                        ),




                      );
                    },),
                  )





                  // Align(
                  //   alignment: AlignmentGeometry.bottomCenter,
                  //   child: AnimatedSwitcher(
                  //     duration: Duration(milliseconds: 350),
                  //     switchInCurve: Curves.easeOut,
                  //     switchOutCurve: Curves.easeIn,
                  //     transitionBuilder: (child, animation) => FadeTransition(
                  //       opacity: animation,
                  //       child: ScaleTransition(scale: Tween(begin: 0.98, end: 1.0).animate(animation), child: child,),
                  //     ),
                  //     child: showFullSlider ? _fullSlider() : _onlyHandle(),
                  //   ),
                  // ),





                ],
              ),
            ),
    );
  }

  // Widget _slierWrapper({required Widget child}) {
  //   return Container(
  //     key: child.key,
  //     margin: EdgeInsets.only(bottom: 100),
  //     width: 84,
  //     height: 190,
  //     padding: EdgeInsets.all(4),
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.center, colors: [
  //         Colors.transparent, Colors.white.withValues(alpha: .25),
  //       ]),
  //       borderRadius: BorderRadius.circular(100),
  //     ),
  //     child: child,
  //   );
  // }
  //
  // Widget _onlyHandle() {
  //   return _slierWrapper(child: Align(
  //     alignment: Alignment.bottomCenter,
  //     child: CircleAvatar(
  //       radius: 40,
  //       backgroundColor: Colors.white,
  //       child: Text("NEXT", style: TextStyle(color: Style.theme.colorScheme.primary, fontFamily: "LexendDeca", fontWeight: FontWeight.bold, fontSize: 20,),),
  //     ),
  //   ));
  // }
  //
  // Widget _fullSlider() {
  //   return _slierWrapper(child: Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Column(
  //         children: [
  //           SizedBox(height: 40,),
  //           _arrow(),
  //           _arrow(strong: true),
  //
  //         ],
  //       ),
  //       Dismissible(
  //           key: UniqueKey(), direction: DismissDirection.up,
  //           onDismissed: (direction) => Success(), onUpdate: (details) => progress.value = details.progress,
  //           child: _handle(),
  //       )
  //     ],
  //   ));
  // }
  //
  //
  // Widget _handle() => CircleAvatar(
  //   radius: 40,
  //   backgroundColor: Colors.white,
  //   child: Text("NEXT", style: TextStyle(color: Style.theme.colorScheme.primary, fontFamily: "LexendDeca", fontWeight: FontWeight.bold, fontSize: 20,),),
  // );
  //
  // Widget _arrow({bool strong = false}) => ValueListenableBuilder(
  //   valueListenable: progress, builder: (BuildContext context, double value, Widget? child) => Opacity(opacity: 1 - progress.value, child: Transform.rotate(angle: math.pi / 2, child: SvgPicture.asset("assets/icons/back.svg", width: 20, color: strong ? Colors.white : Colors.white.withValues(alpha: .6),),),),
  // );
  
}
