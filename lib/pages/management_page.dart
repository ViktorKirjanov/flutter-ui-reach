import 'package:flutter/material.dart';

class ManagementPage extends StatefulWidget {
  ManagementPage({Key key}) : super(key: key);

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Management page',
            ),
          ],
        ),
      ),
    );
  }
}
