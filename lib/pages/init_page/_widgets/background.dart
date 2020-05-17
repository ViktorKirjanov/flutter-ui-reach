import 'dart:async';

import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final bool animation;

  const Background({Key key, this.animation = true}) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  Timer _timer;
  Timer _timer2;

  double w;
  double h;
  double cellSize;
  double r1Height = 0;
  double r2Height = 0;
  double r3Height = 0;
  double r4Height = 0;
  double r5Height = 0;
  double r6Height = 0;
  double circle22Size = 0;
  double circle31Size = 0;
  double circle42Size = 0;
  double circle43Size = 0;
  double circle61Size = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: (widget.animation) ? 1000 : 0), () {
      setState(() {
        r1Height = cellSize * 0.6;
        r2Height = cellSize * 0.57;
        r3Height = cellSize * 0.43;
        r4Height = cellSize * 0.6;
        r5Height = cellSize;
        r6Height = cellSize * 0.4;
      });
    });

    _timer2 = Timer(Duration(milliseconds: (widget.animation) ? 2000 : 0), () {
      setState(() {
        circle22Size = r2Height;
        circle31Size = r3Height;
        circle43Size = r4Height;
        circle42Size = r4Height;
        circle61Size = r6Height;
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    if (_timer2 != null) {
      _timer2.cancel();
      _timer2 = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    cellSize = w / 3;

    final int _duration = 500;

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: cellSize * 0.6,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AnimatedContainer(
                    color: Color.fromRGBO(192, 58, 101, 1),
                    height: r1Height,
                    duration: Duration(milliseconds: _duration),
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                Expanded(
                  child: AnimatedContainer(
                    color: Color.fromRGBO(192, 58, 101, 1),
                    height: r1Height,
                    duration: Duration(milliseconds: _duration),
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color.fromRGBO(204, 61, 106, 1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: cellSize * 0.57,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 0,
                        top: 0,
                        child: AnimatedContainer(
                          width: circle22Size,
                          height: circle22Size,
                          duration: Duration(milliseconds: _duration),
                          curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(227, 80, 126, 1),
                            borderRadius: BorderRadius.only(
                              bottomRight: const Radius.circular(100.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: AnimatedContainer(
                    color: Color.fromRGBO(192, 58, 101, 1),
                    height: r2Height,
                    duration: Duration(milliseconds: _duration),
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: cellSize * 0.43,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: 0,
                          top: 0,
                          child: AnimatedContainer(
                            width: circle31Size,
                            height: circle31Size,
                            duration: Duration(milliseconds: _duration),
                            curve: Curves.fastOutSlowIn,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(192, 58, 101, 1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(100.0),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: AnimatedContainer(
                    color: Color.fromRGBO(192, 58, 101, 1),
                    height: r3Height,
                    duration: Duration(milliseconds: _duration),
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: cellSize * 0.6,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AnimatedContainer(
                    color: Color.fromRGBO(192, 58, 101, 1),
                    height: r4Height,
                    duration: Duration(milliseconds: _duration),
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      AnimatedContainer(
                        color: Color.fromRGBO(192, 58, 101, 1),
                        height: r4Height,
                        duration: Duration(milliseconds: _duration),
                        curve: Curves.fastOutSlowIn,
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: AnimatedContainer(
                          width: circle42Size,
                          height: circle42Size,
                          duration: Duration(milliseconds: _duration),
                          curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(227, 80, 126, 1),
                            borderRadius: BorderRadius.only(
                              bottomRight: const Radius.circular(100.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: AnimatedContainer(
                            width: circle43Size,
                            height: circle43Size,
                            duration: Duration(milliseconds: _duration),
                            curve: Curves.fastOutSlowIn,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(227, 80, 126, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(100.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: cellSize,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: AnimatedContainer(
                    color: Color.fromRGBO(192, 58, 101, 1),
                    height: r5Height,
                    duration: Duration(milliseconds: _duration),
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: cellSize * 0.4,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: AnimatedContainer(
                          width: circle61Size,
                          height: circle61Size,
                          duration: Duration(milliseconds: _duration),
                          curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(227, 80, 126, 1),
                            borderRadius: BorderRadius.only(
                              topRight: const Radius.circular(100.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: AnimatedContainer(
                    color: Color.fromRGBO(192, 58, 101, 1),
                    height: r6Height,
                    duration: Duration(milliseconds: _duration),
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
