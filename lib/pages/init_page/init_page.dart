import 'package:flutter/material.dart';

import '../_widgets/action_button.dart';
import '../main_page.dart';
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(204, 61, 106, 1),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 315,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/bg.png'),
            ),
          ),
          Logo(),
          Welcome(),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              height: 315.0,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 67.0),
                  ActionButton(
                    title: 'Sign In',
                    textColor: Color.fromRGBO(204, 61, 106, 1),
                    backgroundColor: Colors.white,
                    action: () =>
                        Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute<bool>(
                        builder: (BuildContext context) => MainPage(),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  ActionButton(
                    title: 'Sign Up',
                    textColor: Colors.white,
                    backgroundColor: Color.fromRGBO(204, 61, 106, 1),
                    borderSide: true,
                    action: () =>
                        Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute<bool>(
                        builder: (BuildContext context) => MainPage(),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    'Forgot Passwords?',
                    style: TextStyle(
                      fontSize: 14.0,
                      letterSpacing: 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
