import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/app_service.dart';
import '../../utilities/alert_dialog.dart';
import '../../utilities/string_constant.dart';
import '../screens/home/home_screen.dart';
import '../screens/auth/register_page.dart';
import '../screens/auth/login_page.dart';
import 'package:get/get.dart';

/*

MARK: Login View Model

*/
class LoginViewModel {
  Future<void> handleLogin(
    BuildContext context,
    String email,
    String password,
  ) async {
    if (email.isEmpty) {
      CustomSnackBar(
        context,
        const Text("Email cannot be empty."),
      );
    } else if (password.isEmpty) {
      CustomSnackBar(
        context,
        const Text("Password cannot be empty."),
      );
    } else {
      AppService().signIn(
        email,
        password,
        (user, status) async {
          if (status) {
            // Save is_login
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool(Texts.isLoginKey(), true);

            // Action Navigator
            if (!context.mounted) return;
            Get.offAll(HomeScreen());
          } else {
            // Show error in here
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
              CustomSnackBar(
                context,
                const Text("Invalid Email Format"),
              );
            } else {
              CustomSnackBar(
                context,
                const Text("Unregistered Email Address"),
              );
            }
          }
        },
      );
    }
  }

  //MARK: Route to Register
  Future<void> navigationToRegister(BuildContext context) async {
    Get.offAll(RegisterPage());
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
        Get.offAll(HomeScreen);
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
    Get.offAll(LoginPage);
  }
}
