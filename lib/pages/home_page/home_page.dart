import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_dashboard/core/blocs/selected_chart_bar_bloc/selected_chart_bar_bloc.dart';
import '_widgets/header.dart';
import '_widgets/progress.dart';
import '_widgets/queue.dart';
import '_widgets/statistics.dart';
import '_widgets/top_up.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SelectedChartBarBloc>(context).add(ResetChartBarEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 251, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 54.0, 20.0, 0.0),
          child: Column(
            children: <Widget>[
              Header(),
              SizedBox(height: 32.0),
              Progress(),
              SizedBox(height: 26.0),
              TopUp(),
              SizedBox(height: 32.0),
              Statistics(),
              SizedBox(height: 28.0),
              Queue(),
            ],
          ),
        ),
      ),
    );
  }
}
