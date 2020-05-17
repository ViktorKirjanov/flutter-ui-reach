import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_dashboard/core/blocs/progress_button_bloc/progress_button_bloc.dart';

import '_widgets/action_button.dart';
import '_widgets/loading_button.dart';
import 'init_page/init_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProgressButtonBloc _signoutProgressButtonBloc;

  @override
  void initState() {
    super.initState();
    _signoutProgressButtonBloc = ProgressButtonBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Profile page'),
            SizedBox(height: 50.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: BlocBuilder<ProgressButtonBloc, ProgressButtonState>(
                bloc: _signoutProgressButtonBloc,
                builder: (context, state) {
                  if (state is EnabledProgressButtonState) {
                    return ActionButton(
                      title: 'Log out',
                      textColor: Colors.white,
                      backgroundColor: Color.fromRGBO(204, 61, 106, 1),
                      action: () {
                        _signoutProgressButtonBloc
                            .add(LoadingProgressButtonEvent());
                        Timer(Duration(milliseconds: 1000), () {
                          setState(() {
                            _signoutProgressButtonBloc
                                .add(EnableProgressButtonEvent());
                            Navigator.of(context, rootNavigator: true)
                                .pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) => InitPage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          });
                        });
                      },
                    );
                  } else if (state is LoadingProgressButtonState) {
                    return LoadingButton(
                      backgroundColor: Color.fromRGBO(204, 61, 106, 1),
                      textColor: Colors.white,
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
