import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/app_service.dart';
import '../../utilities/string_constant.dart';
import '../../views/login_page.dart';
import '../../models/product_type.dart';

class HomeViewModel {
  ViewType viewType = ViewType.list;

  //MARK: gride
  // int crossAxisCount = 2;
  // double aspectRatio = 1.4;

  //MARK: list
  int crossAxisCount = 1;
  double aspectRatio = 4;

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

  //MARK: Get List Items
  void handleItemsList(BuildContext context) async {
    AppService().menuList(
      (items, status) async {
        if (status) {
          debugPrint('${items?.data?[1].imageUrl}success');
        } else {
          debugPrint('failed');
        }
      },
    );
  }
}
