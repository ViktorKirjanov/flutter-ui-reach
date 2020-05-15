import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_dashboard/core/blocs/selected_chart_bar_bloc/selected_chart_bar_bloc.dart';

class ChartBar extends StatefulWidget {
  final int index;
  final double value;

  const ChartBar({
    Key key,
    @required this.index,
    @required this.value,
  }) : super(key: key);

  @override
  _ChartBarState createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  Timer _timer;
  double h = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: 500), () {
      setState(() {
        h = widget.value * 38 / 15;
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color;
    return Expanded(
      child: Center(
        child: GestureDetector(
          child: BlocBuilder<SelectedChartBarBloc, SelectedChartBarState>(
            builder: (context, state) {
              if (state is SelectedState && state.index == widget.index) {
                color = Color.fromRGBO(69, 59, 129, 1);
              } else {
                color = Color.fromRGBO(204, 61, 106, 1);
              }
              return AnimatedContainer(
                height: h,
                width: 18,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
              );
            },
          ),
          onTap: () {
            BlocProvider.of<SelectedChartBarBloc>(context)
                .add(SelectChartBarEvent(widget.index));
          },
        ),
      ),
    );
  }
}
