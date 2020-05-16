import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_dashboard/core/blocs/selected_chart_bar_bloc/selected_chart_bar_bloc.dart';
import 'package:login_and_dashboard/pages/init_page/init_page.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<SelectedChartBarBloc>(
            create: (BuildContext context) => SelectedChartBarBloc(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        accentColor: Color.fromRGBO(204, 61, 106, 1),
      ),
      home: InitPage(),
    );
  }
}
