import 'package:cashier_mate/Utilities/string_constant.dart'; // string constant file
import 'package:cashier_mate/app/main_page.dart';
import 'package:flutter/material.dart'; // default package
import 'package:cashier_mate/screens/auth/login_page.dart';
import 'package:cashier_mate/models/product_type.dart'; // save data
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light, // set static light mode
      debugShowCheckedModeBanner: false, // hide debug mode
      //'title:' On iOS this value cannot be used.
      // to use this titile in iOS so change in
      // CFBundleDisplayName from the app's Info.plist
      title: Texts.titleApp(),
      // 'Future' is function to set base root
      home: FutureBuilder<bool>(
        future: checkLogin(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            return const MainPage();
          } else {
            return const loginScreen();
          }
        },
      ),
    );
  }
}
