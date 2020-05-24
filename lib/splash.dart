import 'package:amuseui/fade_in.dart';
import 'package:amuseui/fade_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with AnimationMixin {
  AnimationController fadeInController;
  AnimationController fadeOutController;

  Animation<double> translateRight;
  Animation<double> translateLeft;
  Animation<double> scale;

  @override
  void initState() {
//    fadeInController = createController();
//    fadeOutController = createController();
//
//    translateY = (-100.0).tweenTo(0.0).animatedBy(fadeInController);
//    scale = 1.0.tweenTo(0.0).animatedBy(fadeOutController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                FadeOut(
                  5,
                  Container(
                    color: Colors.white,
                    width: 200,
                    height: 400,
                  ),
                  -150,
                ),
                FadeOut(
                  5,
                  Container(
                    color: Colors.blue,
                    width: 200,
                    height: 400,
                  ),
                  150,
                ),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                backgroundColor: Colors.black45,
                valueColor: AlwaysStoppedAnimation(Colors.pink),
              ),
            ),
//          _progressIndicator(),
//          _requestButton(),
          ],
        ),
      ),
    );
  }
}
