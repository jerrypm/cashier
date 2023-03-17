import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:cashier_mate/utilities/string_constant.dart';

import '../../view_models/main_view_models.dart';
import '../screens/home/home_screen.dart';
import '../screens/history/history_screen.dart';
import '../screens/order/order_screen.dart';
import '../screens/settings/settings_screen.dart';
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
    const HomeScreen(),
    const HistoryScreen(),
    OrderScreen(),
    SettingsScreen(),
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
                    Texts.homeIcon(),
                    height: 25,
                    width: 25,
                    color: AppColors.darkBlue,
                  )
                : Image.asset(
                    Texts.homeIcon(),
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: Texts.titleHome(),
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? Image.asset(
                    Texts.historyIcon(),
                    height: 25,
                    width: 25,
                    color: AppColors.darkBlue,
                  )
                : Image.asset(
                    Texts.historyIcon(),
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: Texts.titleHistory(),
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? Image.asset(
                    Texts.orderIcon(),
                    height: 25,
                    width: 25,
                    color: AppColors.darkBlue,
                  )
                : Image.asset(
                    Texts.orderIcon(),
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: Texts.titleOrders(),
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? Image.asset(
                    Texts.settingIcon(),
                    height: 25,
                    width: 25,
                    color: AppColors.darkBlue,
                  )
                : Image.asset(
                    Texts.settingIcon(),
                    height: 25,
                    width: 25,
                    color: Colors.grey,
                  ),
            label: Texts.titleSettings(),
          ),
        ],
        activeColor: AppColors.darkBlue,
      ),
    );
  }
}
