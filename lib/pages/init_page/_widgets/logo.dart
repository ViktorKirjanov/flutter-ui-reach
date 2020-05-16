import 'dart:async';

import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  Timer _timer;
  double _size = 0;
  double _left = 30 + 61 / 2;
  double _top = 100 + 61 / 2;
  int _duration = 500;
  double _borderRadius = 0;
  double _logoW = 0;
  double _logoH = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: 500), () {
      setState(() {
        _size = 61;
        _left = 30;
        _top = 100;
        _borderRadius = 18;
        _logoW = 34;
        _logoH = 31;
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
      top: _top,
      duration: Duration(milliseconds: _duration),
      child: AnimatedContainer(
        height: _size,
        width: _size,
        duration: Duration(milliseconds: _duration),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(_borderRadius),
          ),
        ),
        child: Center(
          child: AnimatedContainer(
            height: _logoH,
            width: _logoW,
            duration: Duration(milliseconds: _duration),
            child: FittedBox(
              child: Image.asset('assets/icons/logo.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
