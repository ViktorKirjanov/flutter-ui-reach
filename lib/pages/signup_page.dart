import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_dashboard/core/blocs/progress_button_bloc/progress_button_bloc.dart';
import 'package:login_and_dashboard/pages/_widgets/loading_button.dart';
import 'package:login_and_dashboard/pages/main_page.dart';

import '_widgets/action_button.dart';
import 'init_page/_widgets/background.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  ProgressButtonBloc _signInProgressButtonBloc;

  bool passwordVisible = true;
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  double _begin = 0;
  double _end = 0;

  _afterLayout(_) {
    setState(() {
      _begin = MediaQuery.of(context).size.height * 0.62;
      _end = MediaQuery.of(context).size.height - 162.0;
      _animation = Tween(begin: _begin, end: _end).animate(_controller)
        ..addListener(() {
          setState(() {});
        });
    });
  }

  @override
  void initState() {
    super.initState();
    _signInProgressButtonBloc = ProgressButtonBloc(true);
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _animation = Tween(begin: _begin, end: _end).animate(_controller);

    // todo: refactor those 2 nodes somehow
    _focusNode1.addListener(() {
      if (_focusNode1.hasFocus) {
        _controller.forward();
      } else {
        if (_focusNode2.hasFocus) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      }
    });

    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        _controller.forward();
      } else {
        if (_focusNode1.hasFocus) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(204, 61, 106, 1),
      body: Container(
        child: Stack(
          children: <Widget>[
            Background(animation: false),
            Positioned(
              top: 56,
              left: 17,
              child: Container(
                height: 50,
                width: 50,
                child: RawMaterialButton(
                  highlightColor: Colors.white.withOpacity(0.16),
                  splashColor: Colors.white.withOpacity(0.12),
                  child: Image.asset('assets/icons/back.png'),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Spacer(),
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 44.0, 30.0, 50.0),
                  height: _animation.value,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0),
                    ),
                  ),
                  child: _buildForm(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 12.0),
          child: Text(
            'Email',
            style: TextStyle(
              fontSize: 14.0,
              letterSpacing: 0.02,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(86, 81, 115, 1.0),
            ),
          ),
        ),
        Container(
          height: 46.0,
          child: TextField(
            focusNode: _focusNode1,
            cursorColor: Color.fromRGBO(204, 61, 106, 1),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 0.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(14.0),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(14.0),
                  ),
                  borderSide: BorderSide(color: Colors.red)),
              hintText: "Type in your email",
            ),
          ),
        ),
        SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 12.0),
          child: Text(
            'Password',
            style: TextStyle(
              fontSize: 14.0,
              letterSpacing: 0.02,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(86, 81, 115, 1.0),
            ),
          ),
        ),
        Container(
          height: 46.0,
          child: TextField(
            focusNode: _focusNode2,
            cursorColor: Color.fromRGBO(204, 61, 106, 1),
            obscureText: passwordVisible,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                padding: EdgeInsets.only(right: 15),
                icon: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Color.fromRGBO(144, 141, 161, 1),
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 0.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(14.0),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(14.0),
                  ),
                  borderSide: BorderSide(color: Colors.red)),
              hintText: "Type in your password",
            ),
          ),
        ),
        Spacer(),
        BlocBuilder<ProgressButtonBloc, ProgressButtonState>(
          bloc: _signInProgressButtonBloc,
          builder: (context, state) {
            if (state is EnabledProgressButtonState) {
              return ActionButton(
                title: 'Sign Up',
                textColor: Colors.white,
                backgroundColor: Color.fromRGBO(204, 61, 106, 1),
                action: () {
                  _signInProgressButtonBloc.add(LoadingProgressButtonEvent());
                  Timer(Duration(milliseconds: 1000), () {
                    setState(() {
                      _signInProgressButtonBloc
                          .add(EnableProgressButtonEvent());
                      Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) => MainPage(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    });
                  });
                },
              );
            } else if (state is LoadingProgressButtonState) {
              return LoadingButton(
                backgroundColor: Color.fromRGBO(204, 61, 106, 1),
                textColor: Colors.white,
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
