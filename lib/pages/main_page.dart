import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_and_dashboard/pages/_widgets/alert_dialog.dart';
import 'package:login_and_dashboard/pages/home_page/home_page.dart';
import 'package:login_and_dashboard/pages/management_page.dart';
import 'package:login_and_dashboard/pages/profile_page.dart';
import 'package:login_and_dashboard/pages/report_page.dart';
import 'package:login_and_dashboard/colors.dart' as AppColors;

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex;
  final _pageOptions = [
    HomePage(),
    ReportPage(),
    Container(),
    ManagementPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  void navigationTapped(int index) {
    if (index == 2) {
      print('middle action');
      showAlertDialog(context);
      return;
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  Widget _buildBottomNavigationBar() {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildMenuIcon(index: 0, icon: 'home'),
            title: _buildMenuTitle(index: 0, title: 'Home'),
          ),
          BottomNavigationBarItem(
            icon: _buildMenuIcon(index: 1, icon: 'report'),
            title: _buildMenuTitle(index: 1, title: 'Report'),
          ),
          BottomNavigationBarItem(
            icon: _buildMiddleMenuItem(),
            title: Container(height: 0.0),
          ),
          BottomNavigationBarItem(
            icon: _buildMenuIcon(index: 3, icon: 'management'),
            title: _buildMenuTitle(index: 3, title: 'Management'),
          ),
          BottomNavigationBarItem(
            icon: _buildMenuIcon(index: 4, icon: 'profile'),
            title: _buildMenuTitle(index: 4, title: 'Profile'),
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) => navigationTapped(index),
      ),
    );
  }

  Widget _buildMenuIcon({
    @required int index,
    @required String icon,
    bool notifications = false,
  }) {
    return Container(
      width: 40.0,
      height: 35.0,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment(0.0, 0.0),
            child: (_currentIndex == index)
                ? Image.asset('assets/icons/navigation_${icon}_active.png')
                : Image.asset('assets/icons/navigation_${icon}_not_active.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTitle({
    @required int index,
    @required String title,
  }) {
    return Text(
      title,
      style: TextStyle(
        color: (_currentIndex == index)
            ? AppColors.mainSelectedColor
            : Color.fromRGBO(144, 141, 161, 1),
        fontSize: 11.0,
        letterSpacing: 0.5,
        fontWeight:
            (_currentIndex == index) ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }

  Widget _buildMiddleMenuItem() {
    return Theme(
      data: new ThemeData(splashFactory: const NoSplashFactory()),
      child: new Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        width: 52.0,
        height: 52.0,
        decoration: new BoxDecoration(
          color: Color.fromRGBO(204, 61, 106, 1),
          borderRadius: new BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(204, 61, 106, .2),
              spreadRadius: 0,
              blurRadius: 14,
              offset: Offset(0.0, 6.0),
            ),
          ],
        ),
        child: Image.asset('assets/icons/add.png'),
      ),
    );
  }
}

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    MaterialInkController controller,
    RenderBox referenceBox,
    Offset position,
    Color color,
    TextDirection textDirection,
    bool containedInkWell = false,
    rectCallback,
    BorderRadius borderRadius,
    ShapeBorder customBorder,
    double radius,
    onRemoved,
  }) {
    return NoSplash(
      controller: controller,
      referenceBox: referenceBox,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
  })  : assert(controller != null),
        assert(referenceBox != null),
        super(
          controller: controller,
          referenceBox: referenceBox,
        );

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
