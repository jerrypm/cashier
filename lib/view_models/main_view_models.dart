import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/app_service.dart';
import '../../utilities/string_constant.dart';
import '../screens/auth/login_page.dart';
import '../../models/product_type.dart';
import '../../models/menu_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  //MARK: grid
  ViewType viewType = ViewType.grid;
  int crossAxisCount = 2;
  double aspectRatio = 0.9;
  double spacing = 16;

  final resultFoods = <DataSubModel>[].obs;

  //MARK: list
  // int crossAxisCount = 1;
  // double aspectRatio = 4;

  //MARK: Total Item
  int totalOrders = 0;

  //MARK: Save logout
  Future<void> navigationLogout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(Texts.isLoginKey());

    // navigation back to root login
    if (!context.mounted) return;
    Get.offAll(() => const loginScreen());
  }

  //MARK: Hit API Using GetX

  @override
  void onInit() {
    super.onInit();
    handleItemsList();
  }

  //MARK: Get List Items
  void handleItemsList() async {
    AppService().menuList(
      (items, status) async {
        if (status) {
          debugPrint('${items?.data?[1].imageUrl}success');

          if (items != null) {
            for (var element in items.data!) {
              resultFoods.add(element);
            }
          }
        } else {
          debugPrint('failed');
        }
      },
    );
  }
}
