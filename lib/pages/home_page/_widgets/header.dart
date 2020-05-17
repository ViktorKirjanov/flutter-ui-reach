import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  'Hello, Andrea',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(41, 34, 84, 1.0),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                child: Text(
                  'This is your dashboard',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color.fromRGBO(86, 81, 115, 1.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        Image.asset('assets/icons/avatar.png'),
      ],
    );
  }
}
