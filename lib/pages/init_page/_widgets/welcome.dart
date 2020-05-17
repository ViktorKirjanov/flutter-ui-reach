import 'dart:async';

import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  final double bottomPadding;

  const Welcome({Key key, this.bottomPadding}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  Timer _timer;
  double _left = 500;
  double _opacity = 0.5;
  int _duration = 2000;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: 500), () {
      setState(() {
        _left = 30;
        _opacity = 1.0;
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: _left,
      bottom: widget.bottomPadding + 42.0,
      duration: Duration(milliseconds: _duration),
      curve: Curves.fastOutSlowIn,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: _duration),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome \nto Reach',
              style: TextStyle(
                fontSize: 38.0,
                letterSpacing: 0.1,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 14.0),
            Text(
              'GLOBAL COMMUNICATION PLATFORM',
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
    );
  }
}
