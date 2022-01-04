import 'package:flutter/material.dart';
import 'package:login_flutter/ui/screen/home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndexBody = 0;

  final List<Widget> _dashboardBodyWidgets = <Widget>[
    const HomeScreen(),
    const Placeholder(color: Colors.green),
    const Placeholder(color: Colors.black),
    const Placeholder(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _dashboardBodyWidgets[_selectedIndexBody],
      body: IndexedStack(
        index: _selectedIndexBody,
        children: _dashboardBodyWidgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.amber[800],
        type: BottomNavigationBarType.fixed,
        items: _mainMenuItems(),
        currentIndex: _selectedIndexBody,
        onTap: (index) {
          setState(() {
            _selectedIndexBody = index;
          });
        },
        showUnselectedLabels: true,
        showSelectedLabels: true,
      ),
    );
  }

  List<BottomNavigationBarItem> _mainMenuItems() {
    return <BottomNavigationBarItem>[
      _mainMenuItemWidget('Home', Icons.home),
      _mainMenuItemWidget('Mid', Icons.ac_unit_rounded),
      _mainMenuItemWidget('Faforite', Icons.favorite),
    ];
  }

  BottomNavigationBarItem _mainMenuItemWidget(
      String menuTitle, IconData iconData) {
    return BottomNavigationBarItem(
      activeIcon: Icon(iconData),
      icon: Icon(iconData),
      label: menuTitle,
    );
  }
}
