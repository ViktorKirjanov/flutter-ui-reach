import 'package:flutter/material.dart';

class ProgressItem extends StatelessWidget {
  final Image image;
  final String title;
  final int count;

  const ProgressItem({Key key, this.image, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 0.0),
      height: 123.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          image,
          SizedBox(height: 18.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.0,
              color: Color.fromRGBO(144, 141, 161, 1),
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(41, 34, 84, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
