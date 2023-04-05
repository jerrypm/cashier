import 'package:get/get.dart';
import '../views/payment/payment_success_page.dart';

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
