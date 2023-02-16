import 'package:flutter/material.dart';
import 'package:cashier_mate/Services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cashier_mate/Utilities/string_constant.dart';
import 'package:cashier_mate/Views/login_page.dart';

class HomeViewModel {
  // save logout

  Future<void> navigationLogout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(Texts.isLoginKey());

    // navigation back to root login
    if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => LoginPage(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
