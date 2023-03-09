import '../../Views/manual_page.dart';
import '../../Views/order_page.dart';
import 'package:get/get.dart';

class Routes {
  static const INITIAL = '/home';

  static final routes = [
    GetPage(
      name: '/orders',
      page: () => const OrderPage(),
    ),
    GetPage(
      name: '/manual',
      page: () => const ManualPage(),
    ),
  ];
}
