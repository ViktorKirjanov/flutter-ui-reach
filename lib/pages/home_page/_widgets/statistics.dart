import 'package:flutter/material.dart';

import 'chart.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  var _duration = [
    "Daily",
    "Weekly",
    "Monthly",
  ];

  var _currentSelectedValue = "Weekly";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Statistic',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(41, 34, 84, 1.0),
              ),
            ),
            _buildDropDown(),
          ],
        ),
        SizedBox(height: 16.0),
        Chart(),
      ],
    );
  }

  Widget _buildDropDown() {
    return Container(
      width: 105.0,
      height: 36.0,
      padding: EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(
          color: Color.fromRGBO(224, 222, 234, 1),
          width: 1.0,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Container(
            padding: EdgeInsets.only(right: 17.0),
            child: Image.asset('assets/icons/drop_down.png'),
          ),
          value: _currentSelectedValue,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              _currentSelectedValue = newValue;
            });
          },
          items: _duration.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(41, 34, 84, 1.0),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
