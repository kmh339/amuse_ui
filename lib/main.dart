import 'package:amuseui/animated_background.dart';
import 'package:amuseui/fade_in.dart';
import 'package:amuseui/particles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'text_field_input_decoration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormBuilderState> _key = GlobalKey<FormBuilderState>();

  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
  }

  void _onLoginButtonPressed() {
    _key.currentState.save();

    if (_key.currentState.validate()) {
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _onSignUpButtonPressed() {}

  void _onResetPasswordButtonPressed() {}

  void _onNaverLoginButtonPressed() {}

  void _onKakaoLoginButtonPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
//          Positioned.fill(child: AnimatedBackground()),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                Colors.yellow[100],
                Colors.white,
              ])),
            ),
          ),
          Positioned.fill(child: Particles(5)),
          Positioned.fill(
            child: SafeArea(
              minimum: EdgeInsets.all(16),
              child: FormBuilder(
                key: _key,
                autovalidate: _autoValidate,
                child: SingleChildScrollView(
                  child: Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                        height: 200,
                      ),
                      FadeIn(
                        2,
                        FormBuilderTextField(
                          attribute: 'email',
                          decoration: textInputDecoration('Email', Icon(Icons.email), Colors.deepOrange),
                          validators: [
                            FormBuilderValidators.required(errorText: '이메일을 입력해야 합니다.'),
                            FormBuilderValidators.email(errorText: '올바른 이메일 형식이 아닙니다.'),
                          ],
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      FadeIn(
                        3,
                        FormBuilderTextField(
                          attribute: 'password',
                          decoration: textInputDecoration('Password', Icon(Icons.lock), Colors.deepOrange),
                          validators: [
                            FormBuilderValidators.required(errorText: '비밀번호를 입력해야 합니다.'),
                            FormBuilderValidators.minLength(8, errorText: '비밀번호는 최소 8글자 이상이어야 합니다.'),
                          ],
                          obscureText: true,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeIn(
                        3.5,
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text('아직 회원이 아니신가요?'),
                              InkWell(
                                child: Text(
                                  '회원가입',
                                  style: TextStyle(color: Colors.lightBlue),
                                ),
                                onTap: () {
                                  _onSignUpButtonPressed();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeIn(
                        4,
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text('비밀번호를 잊으셨나요?'),
                              InkWell(
                                child: Text(
                                  '비밀번호 찾기',
                                  style: TextStyle(color: Colors.lightBlue),
                                ),
                                onTap: () {
                                  _onResetPasswordButtonPressed();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeIn(
                        4.3,
                        RaisedButton(
                          onPressed: () {
                            _onLoginButtonPressed();
                          },
                          hoverElevation: 5,
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: GradientColors.noontoDusk,
                              ),
                            ),
                            child: const Text(
                              'LOG IN',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeIn(
                        4.5,
                        Text(
                          'Or login with',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _onNaverLoginButtonPressed();
                            },
                            child: FadeIn(
                              5,
                              Card(
                                elevation: 6,
                                child: Image.asset(
                                  'assets/naver_login_icon.png',
                                  height: 50,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _onKakaoLoginButtonPressed();
                            },
                            child: FadeIn(
                              5.3,
                              Card(
                                elevation: 6,
                                child: Image.asset(
                                  'assets/kakaotalk-logo.png',
                                  height: 50,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
