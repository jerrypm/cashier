import '../../view_models/main_view_models.dart';
import '../screens/home/home_screen.dart';
import '../screens/history/history_screen.dart';
import '../screens/order/order_screen.dart';
import '../screens/settings/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final HomeViewModel homeViewModel = HomeViewModel();
  int selectedIndex = 0;

  //MARK: List Items Bottom Bar
  final List<Widget> children = [
    const HomeScreen(),
    const HistoryScreen(),
    OrderScreen(),
    const SettingsScreen(),
  ];

  //MARK: Action Tap Index Bottom Nav bar
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: Body
      body: children[selectedIndex],

      //MARK: Tabbar Navigation
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        height: 60,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? Image.asset(
                    'assets/icons/home.png',
                    height: 25,
                    width: 25,
                    color: Colors.blue,
                  )
                : Image.asset(
                    'assets/icons/home.png',
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? Image.asset(
                    'assets/icons/history.png',
                    height: 25,
                    width: 25,
                    color: Colors.blue,
                  )
                : Image.asset(
                    'assets/icons/history.png',
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: 'history',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? Image.asset(
                    'assets/icons/orders.png',
                    height: 25,
                    width: 25,
                    color: Colors.blue,
                  )
                : Image.asset(
                    'assets/icons/orders.png',
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? Image.asset(
                    'assets/icons/settings.png',
                    height: 25,
                    width: 25,
                    color: Colors.blue,
                  )
                : Image.asset(
                    'assets/icons/settings.png',
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
