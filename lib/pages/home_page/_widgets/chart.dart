import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_dashboard/core/blocs/selected_chart_bar_bloc/selected_chart_bar_bloc.dart';
import 'package:login_and_dashboard/pages/home_page/_widgets/chart_bar.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
        Positioned(
          bottom: 47.0,
          left: 14.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              _buildStatisticY(title: 60),
              _buildStatisticY(title: 45),
              _buildStatisticY(title: 30),
              _buildStatisticY(title: 15),
              _buildStatisticY(title: 0),
            ],
          ),
        ),
        Positioned(
          bottom: 54.0,
          left: 0,
          child: Column(
            children: <Widget>[
              _buildStatisticYLine(context),
              SizedBox(height: 36.0),
              _buildStatisticYLine(context),
              SizedBox(height: 36.0),
              _buildStatisticYLine(context),
              SizedBox(height: 36.0),
              _buildStatisticYLine(context),
              SizedBox(height: 36.0),
              _buildStatisticYLine(context),
            ],
          ),
        ),
        Positioned(
          // left: 56.0,
          left: 38.0,
          bottom: 20.0,
          child: Container(
            width: MediaQuery.of(context).size.width - 38 - 14 - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildXStep(title: 'M', index: 0),
                _buildXStep(title: 'T', index: 1),
                _buildXStep(title: 'W', index: 2),
                _buildXStep(title: 'T', index: 3),
                _buildXStep(title: 'F', index: 4),
                _buildXStep(title: 'S', index: 5),
                _buildXStep(title: 'S', index: 6),
              ],
            ),
          ),
        ),
        Positioned(
          left: 38.0,
          bottom: 54.0,
          child: Container(
            width: MediaQuery.of(context).size.width - 38 - 14 - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ChartBar(index: 0, value: 15),
                ChartBar(index: 1, value: 40),
                ChartBar(index: 2, value: 18),
                ChartBar(index: 3, value: 45),
                ChartBar(index: 4, value: 28),
                ChartBar(index: 5, value: 55),
                ChartBar(index: 6, value: 38),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatisticY({@required int title}) {
    return Padding(
      padding: EdgeInsets.only(top: 22.0),
      child: Text(
        title.toString(),
        style: TextStyle(
          fontSize: 12.0,
          color: Color.fromRGBO(144, 141, 161, 1),
        ),
      ),
    );
  }

  Widget _buildStatisticYLine(context) {
    return Container(
      margin: EdgeInsets.only(
        left: 38.0,
      ),
      height: 1.0,
      width: MediaQuery.of(context).size.width - 38 - 14 - 40,
      color: Color.fromRGBO(224, 222, 234, 1),
    );
  }

  Widget _buildXStep({@required String title, @required int index}) {
    bool selected;
    return Expanded(
      child: Center(
        child: BlocBuilder<SelectedChartBarBloc, SelectedChartBarState>(
          builder: (context, state) {
            if (state is SelectedState && state.index == index) {
              selected = true;
            } else {
              selected = false;
            }
            return Container(
              height: 26.0,
              width: 26.0,
              decoration: BoxDecoration(
                color:
                    selected ? Color.fromRGBO(237, 235, 244, 1) : Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                    color: selected
                        ? Color.fromRGBO(86, 81, 115, 1)
                        : Color.fromRGBO(144, 141, 161, 1),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
