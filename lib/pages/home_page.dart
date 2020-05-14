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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 54.0, 20.0, 0.0),
          child: Column(
            children: <Widget>[
              _buildHeader(),
              SizedBox(height: 32.0),
              _buildProgressData(),
              SizedBox(height: 26.0),
              _buildTopUp(),
              SizedBox(height: 38.0),
              _buildStatistics(),
              SizedBox(height: 28.0),
              _buildQueue(),
            ],
          ),
        ),
      ),
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

  Widget _buildTopUp() {
    return Container(
      height: 65.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }

  Widget _buildStatistics() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Statistic',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(41, 34, 84, 1.0),
              ),
            ),
            Container(
              width: 100.0,
              height: 36.0,
              color: Colors.white,
            )
          ],
        ),
        SizedBox(height: 16.0),
        Container(
          height: 230.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQueue() {
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
            Text(
              'View All',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(204, 61, 106, 1),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        _buildQueueItem(),
        _buildQueueItem(),
        _buildQueueItem(),
      ],
    );
  }

  Widget _buildQueueItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 14.0),
      height: 85.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
