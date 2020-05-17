import 'package:flutter/material.dart';

class TopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      height: 65.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('assets/icons/logo.png'),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Reach Credits',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color.fromRGBO(86, 81, 115, 1.0),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '1113195',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(41, 34, 84, 1.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              height: 24.0,
              width: 1.0,
              color: Color.fromRGBO(224, 222, 234, 1),
            ),
          ),
          Text(
            'Top up Credits',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(204, 61, 106, 1),
            ),
          ),
        ],
      ),
    );
  }
}
