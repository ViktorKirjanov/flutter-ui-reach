import 'package:flutter/material.dart';

import '../_widgets/action_button.dart';
import '../signin_page.dart';
import '../signup_page.dart';
import '_widgets/background.dart';
import '_widgets/logo.dart';
import '_widgets/welcome.dart';

class InitPage extends StatefulWidget {
  InitPage({Key key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    final double cellSize = w / 3;
    final topHeight = cellSize * (0.6 + 0.57 + 0.43 + 0.6 + 1 + 0.4);
    final bottomHeight = h - topHeight;

    return Scaffold(
      backgroundColor: Color.fromRGBO(204, 61, 106, 1),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              height: topHeight,
              child: Stack(
                children: <Widget>[
                  Background(),
                  Welcome(),
                ],
              ),
            ),
            Logo(),
            _buildButtons(bottomHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(double height) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        height: height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Spacer(),
            ActionButton(
              title: 'Sign In',
              textColor: Color.fromRGBO(204, 61, 106, 1),
              backgroundColor: Colors.white,
              action: () => Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute<bool>(
                  builder: (BuildContext context) => SigninPage(),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ActionButton(
              title: 'Sign Up',
              textColor: Colors.white,
              backgroundColor: Color.fromRGBO(204, 61, 106, 1),
              borderSide: true,
              action: () => Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute<bool>(
                  builder: (BuildContext context) => SignupPage(),
                ),
              ),
            ),
            Spacer(),
            ActionButton(
              title: 'Forgot Passwords?',
              textColor: Colors.white,
              backgroundColor: Color.fromRGBO(204, 61, 106, 1),
              borderSide: false,
              fontSize: 14.0,
              letterSpacing: 0.05,
              fontWeight: FontWeight.w500,
              action: () => Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute<bool>(
                  builder: (BuildContext context) => SigninPage(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
