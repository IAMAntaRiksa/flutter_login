import 'package:flutter/material.dart';
import 'package:login_flutter/ui/screen/home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final int _selectedIndex = 0;
  final List<Widget> _dashboardBodyWidgets = <Widget>[
    const HomeScreen(),
    const Placeholder(color: Colors.blue),
    const Placeholder(color: Colors.green),
    const Placeholder(color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _dashboardBodyWidgets[1],
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: _mainMenuItems(),
          currentIndex: _selectedIndex
          // selectedLabelStyle: selectedMainMenuStyle,
          // unselectedLabelStyle: unselectedMainMenuStyle,
          ),
    );
  }

  List<BottomNavigationBarItem> _mainMenuItems() {
    return <BottomNavigationBarItem>[
      _mainMenuItemWidget('Home', Icons.home),
      _mainMenuItemWidget('Search', Icons.search),
      _mainMenuItemWidget('Favorite', Icons.favorite),
      _mainMenuItemWidget('Profile', Icons.person),
    ];
  }

  BottomNavigationBarItem _mainMenuItemWidget(
      String menuTitle, IconData iconData) {
    return BottomNavigationBarItem(
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
        child: Icon(
          iconData,
          color: Colors.yellowAccent,
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
        child: Icon(iconData, color: Colors.blue),
      ),
      label: menuTitle,
    );
  }
}
