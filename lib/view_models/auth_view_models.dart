import 'dart:convert';
import 'package:cashier_mate/models/user_model.dart';
import 'package:cashier_mate/services/app_service.dart';
import 'package:cashier_mate/utilities/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cashier_mate/utilities/string_constant.dart';

import 'package:cashier_mate/views/home_page.dart';
import 'package:cashier_mate/views/register_page.dart';
import 'package:cashier_mate/views/login_page.dart';

/*

MARK: Login View Model

*/
class LoginViewModel {
  Future<void> handleLogin(
    BuildContext context,
    String email,
    String password,
  ) async {
    AppService().signIn(email, password, (user, status) async {
      if (status) {
        // Save is_login
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(Texts.isLoginKey(), true);

        // Action Navigator
        if (!context.mounted) return;
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => HomePage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      } else {
        // Show error in here
        CustomSnackBar(
          context,
          const Text("Email tidak terdaftar"),
        );
      }
    });
  }

  //MARK: Route to Register
  Future<void> navigationToRegister(BuildContext context) async {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => RegisterPage(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}

/*

MARK: Register View Model

*/

class RegisterViewModel {
  //MARK: Register
  void handleRegister(
    BuildContext context,
    String name,
    String email,
    String password,
  ) async {
    AppService().signUp(name, email, password, (user, status) async {
      if (status) {
        // Save is_login
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(Texts.isLoginKey(), true);

        // Action Navigator
        if (!context.mounted) return;
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => HomePage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      } else {
        // Show error in here
        CustomSnackBar(
          context,
          const Text("Field is Empty"),
        );
      }
    });
  }

  //MARK: Navigation to Login
  Future<void> navigationToLogin(BuildContext context) async {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => LoginPage(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
