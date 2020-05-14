import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 251, 1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 54.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            _buildHeader(),
            SizedBox(height: 32.0),
            _buildProgressData(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressData() {
    return Row(
      children: <Widget>[
        _buildProgressItem(
            image: Image.asset('assets/icons/completed.png'),
            title: 'Completed',
            count: 42),
        SizedBox(width: 16.0),
        _buildProgressItem(
            image: Image.asset('assets/icons/processing.png'),
            title: 'Processing',
            count: 12),
        SizedBox(width: 16.0),
        _buildProgressItem(
            image: Image.asset('assets/icons/failed.png'),
            title: 'Failed',
            count: 8),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
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

  Widget _buildProgressItem({
    @required Image image,
    @required String title,
    @required int count,
  }) {
    return Flexible(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(14.0),
        height: 123.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
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
      ),
    );
  }
}
