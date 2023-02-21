import 'package:cashier_mate/utilities/string_constant.dart';
import 'package:cashier_mate/view_models/main_view_models.dart';
import 'package:cashier_mate/components/item_card.dart';
import 'package:cashier_mate/models/product_type.dart';
import 'package:cashier_mate/views/home_page.dart';
import 'package:cashier_mate/views/manual_page.dart';
import 'package:cashier_mate/views/order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final HomeViewModel homeViewModel = HomeViewModel();
  int selectedIndex = 0;

  final List<Widget> children = [
    HomePage(),
    ManualPage(),
    OrderPage(),
  ];

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Manuals'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notes_outlined), label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
