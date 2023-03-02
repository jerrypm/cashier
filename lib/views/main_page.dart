import '../../view_models/main_view_models.dart';
import '../../views/home_page.dart';
import '../../views/manual_page.dart';
import '../../views/order_page.dart';
import '../../views/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final HomeViewModel homeViewModel = HomeViewModel();
  int selectedIndex = 0;

  //MARK: List Items Bottom Bar
  final List<Widget> children = [
    HomePage(),
    const ManualPage(),
    const OrderPage(),
    const SettingsPage(),
  ];

  //MARK: Action Tap Index Bottom Nav bar
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      debugPrint('$index');
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Manuals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes_outlined),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
