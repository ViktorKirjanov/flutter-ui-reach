import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_dashboard/core/blocs/selected_chart_bar_bloc/selected_chart_bar_bloc.dart';
import 'package:login_and_dashboard/core/data/queue.dart';
import 'package:login_and_dashboard/core/enums/queue_item_status_enum.dart';
import 'package:login_and_dashboard/core/enums/queue_item_type_enum.dart';
import 'package:login_and_dashboard/core/helpers/style_helper.dart';
import 'package:login_and_dashboard/core/models/queue_item_model.dart';
import 'package:login_and_dashboard/pages/home_page/_widgets/chart.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _duration = [
    "Daily",
    "Weekly",
    "Monthly",
  ];

  var _currentSelectedValue = "Weekly";

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
              _buildHeader(),
              SizedBox(height: 32.0),
              _buildProgressData(),
              SizedBox(height: 26.0),
              _buildTopUp(),
              SizedBox(height: 32.0),
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
          padding: const EdgeInsets.only(left: 1.0),
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
        Flexible(
          flex: 1,
          child: _buildInkWellWrapper(
            child: _buildProgressItem(
              image: Image.asset('assets/icons/completed.png'),
              title: 'Completed',
              count: 42,
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Flexible(
          flex: 1,
          child: _buildInkWellWrapper(
            child: _buildProgressItem(
              image: Image.asset('assets/icons/processing.png'),
              title: 'Processing',
              count: 12,
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Flexible(
          flex: 1,
          child: _buildInkWellWrapper(
            child: _buildProgressItem(
              image: Image.asset('assets/icons/failed.png'),
              title: 'Failed',
              count: 8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressItem({
    @required Image image,
    @required String title,
    @required int count,
  }) {
    return Container(
      padding: EdgeInsets.all(14.0),
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

  Widget _buildTopUp() {
    return Container(
      padding: EdgeInsets.all(14.0),
      height: 65.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('assets/icons/logo.png'),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Reach Credits',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color.fromRGBO(86, 81, 115, 1.0),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '1113195',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(41, 34, 84, 1.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              height: 24.0,
              width: 1.0,
              color: Color.fromRGBO(224, 222, 234, 1),
            ),
          ),
          Text(
            'Top up Credits',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(204, 61, 106, 1),
            ),
          ),
        ],
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
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(41, 34, 84, 1.0),
              ),
            ),
            _buildDropDown(),
          ],
        ),
        SizedBox(height: 16.0),
        Chart(),
      ],
    );
  }

  Widget _buildDropDown() {
    return Container(
      width: 105.0,
      height: 36.0,
      padding: EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(
          color: Color.fromRGBO(224, 222, 234, 1),
          width: 1.0,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Container(
            padding: EdgeInsets.only(right: 17.0),
            child: Image.asset('assets/icons/drop_down.png'),
          ),
          value: _currentSelectedValue,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              _currentSelectedValue = newValue;
            });
          },
          items: _duration.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(41, 34, 84, 1.0),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildQueue() {
    List<Widget> queueItemlist = List<Widget>();
    queueList.forEach((QueueItem item) {
      queueItemlist.add(
        _buildInkWellWrapper(child: _buildQueueItemContent(item)),
      );
      queueItemlist.add(SizedBox(height: 14.0));
    });

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Recent Queue',
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
        Column(
          children: queueItemlist,
        ),
      ],
    );
  }

  Widget _buildInkWellWrapper({@required Widget child}) {
    return Container(
      // margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: new Material(
        color: Colors.transparent,
        child: new InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          highlightColor: Colors.transparent,
          splashColor: Color.fromRGBO(204, 61, 106, .1),
          onTap: () {
            print("tapped");
          },
          child: child,
        ),
      ),
    );
  }

  Widget _buildQueueItemContent(QueueItem item) {
    return Container(
      padding: EdgeInsets.all(14.0),
      height: 85.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildQueueItemIcon(item.status),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color.fromRGBO(41, 34, 84, 1.0),
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: <Widget>[
                    Text(
                      item.type.toShortString(),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(144, 141, 161, 1),
                      ),
                    ),
                    (item.date != null) ? _buildTextSeparator() : SizedBox(),
                    Text(
                      (item.date != null) ? item.date : '',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(144, 141, 161, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: <Widget>[
                    Text(
                      item.status.toShortString(),
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: StyleHelper.statusColor(item.status),
                      ),
                    ),
                    _buildTextSeparator(),
                    Text(
                      '${item.progress} sent',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: StyleHelper.statusColor(item.status),
                      ),
                    ),
                    Text(
                      ' out of ${item.goal}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(86, 81, 115, 1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQueueItemIcon(QueueItemStatus status) {
    if (status == QueueItemStatus.Completed)
      return Image.asset('assets/icons/queue_completed.png');
    else
      return Image.asset('assets/icons/queue_processing.png');
  }

  Widget _buildTextSeparator() {
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 1.0),
      width: 3.0,
      height: 3.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(224, 222, 234, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(3.0),
        ),
      ),
    );
  }
}
