//MARK: Hit API Using GetX

import 'package:cashier_mate/views/payment/payment_success_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/app_service.dart';
import '../../utilities/string_constant.dart';
import '../models/order_model.dart';
import '../screens/auth/login_page.dart';
import '../../models/product_type.dart';
import '../../models/menu_model.dart';
import '../utilities/local_storage.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  //MARK: grid
  ViewType viewType = ViewType.grid;
  int crossAxisCount = 2;
  double aspectRatio = 0.9;
  double spacing = 16;

  final resultFoods = <DataSubModel>[].obs;
  final LocalStorage _localStorage = LocalStorage();
  var orders = <Order>[].obs;

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

  // MARK: Init
  @override
  void onInit() {
    super.onInit();
    handleItemsList();
    fetchOrders();
  }

  /*
    MARK: Get List Items API
  */
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

  /*
    MARK: Save local data share preference
  */

  void saveOrders(Order order) async {
    orders.add(order);
    await _localStorage.saveOrder(order);
    update();
  }

  /*
    MARK: Update local data share preference
  */

  @override
  void update([List<Object>? ids, bool condition = true]) {
    orders.refresh();
  }

  /*
    MARK: Load local data share preference
  */

  void fetchOrders() async {
    orders.value = await _localStorage.getOrders();
    update();
  }

  /*
    MARK: detele local data share preference
  */

  void deleteOrder(int index) async {
    orders.removeAt(index);
    await _localStorage.deleteOrderAtIndex(index);
    update();
  }
}

class CartController extends GetxController {
  // final List<Order> _orderItems = [].obs;

  // List<Order> get orderItems => _orderItems;

  double get totalOrder {
    double total = 5000;
    // for (var item in _orderItems) {
    //   total += item.price * item.quantity;
    // }
    return total;
  }

  int get totalItems {
    int total = 0;
    // for (var item in _orderItems) {
    //   total += item.quantity;
    // }
    return total;
  }

  void processPayment(double result) {
    // Tambahkan logika pembayaran di sini
    // Get.back();
    // Get.to(PaymentSuccessPage(totalItem: 10, totalPaid: 1100, change: 10));
    Get.off(
      () => PaymentSuccessPage(totalItem: 10, totalPaid: 1100, change: 10),
      transition: Transition.noTransition, // Pilih transisi yang diinginkan
    );
  }
}
