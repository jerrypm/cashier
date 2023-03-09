import '../../view_models/main_view_models.dart';
import '../../screens/home/home_page.dart';
import '../../screens/manuals/manual_page.dart';
import '../../screens/order/order_page.dart';
import '../../screens/settings/settings_page.dart';
import '../../views/add_item_page.dart';
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
    const HomePage(),
    const ManualPage(),
    AddItemsPage(),
    const OrderPage(),
    const SettingsPage(),
  ];

  //MARK: Action Tap Index Bottom Nav bar
  void onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        Get.to(AddItemsPage(), fullscreenDialog: true);
        debugPrint('$index yoo loo');
      } else {
        selectedIndex = index;
      }
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
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Manuals',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/add_menu_flutter.png'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notes_outlined),
            label: 'Order',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
