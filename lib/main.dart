import 'package:cashier_mate/Utilities/string_constant.dart'; // string constant file
import 'package:cashier_mate/Views/home_page.dart';
import 'package:flutter/material.dart'; // default package
import 'Views/login_page.dart'; //
import 'Views/register_page.dart'; //
import 'package:shared_preferences/shared_preferences.dart'; // save data

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // hide debug mode
      title: Texts.titleApp(),
      // 'Future' is function to set base root
      home: FutureBuilder<bool>(
        future: checkLogin(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }

  // Function ini untuk check login
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(Texts.isLoginKey()) ?? false;
    return isLoggedIn;
  }
}
