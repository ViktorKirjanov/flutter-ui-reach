import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_dashboard/core/blocs/selected_chart_bar_bloc/selected_chart_bar_bloc.dart';
import 'package:login_and_dashboard/pages/init_page/init_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<SelectedChartBarBloc>(
            create: (BuildContext context) => SelectedChartBarBloc(),
          ),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Reach',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: Color.fromRGBO(224, 222, 234, 1),
        accentColor: Color.fromRGBO(204, 61, 106, 1),
      ),
      home: InitPage(),
    );
  }
}
