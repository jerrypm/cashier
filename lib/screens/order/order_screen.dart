import 'package:cashier_mate/models/order_model.dart';
import 'package:cashier_mate/screens/order/payment_page.dart';
import 'package:cashier_mate/utilities/alert_dialog.dart';
import 'package:cashier_mate/utilities/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/color_custom.dart';
import '../../view_models/main_view_models.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderScreen> {
  final MainViewModel orderViewModel = Get.put(MainViewModel());

  double calculateTotalPrice() {
    return orderViewModel.orders
        .fold(0, (sum, product) => sum + product.totalPrice!);
  }

  //MARK: Search
  Future<void> reloadList() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      orderViewModel.orders.refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: backgound
      backgroundColor: AppColors.backgroundColor,

      //MARK: AppBar
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          Texts.titleOrders(),
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      //MARK: Body
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            if (orderViewModel.orders.isEmpty)
              Expanded(
                child: Center(
                  child: Image.asset(
                    Texts.placeholderList(),
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            Expanded(
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: reloadList,
                  child: ListView.builder(
                    itemCount: orderViewModel.orders.length,
                    itemBuilder: (context, index) {
                      final Order order = orderViewModel.orders[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.secondaryColor.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: SizedBox(
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  order.imageUrl ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            order.title ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color:
                                    AppColors.secondaryColor.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  '\$${order.totalPrice}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          trailing: Column(
                            children: [
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.delete_forever_outlined),
                                color: Colors.red,
                                onPressed: () async {
                                  CustomDialog(
                                    title: 'Delete this item?',
                                    subTitle:
                                        'Are you sure you want to delete this item?',
                                    cancelButton: TextButton(
                                      onPressed: () {
                                        Get.back(result: false);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    deleteButton: ElevatedButton(
                                      onPressed: () {
                                        orderViewModel.deleteOrder(index);
                                        Get.back(result: true);
                                      },
                                      child: Text('Delete'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    radius: 10.0, // set custom radius
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            if (orderViewModel.orders.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        'Total: \$${calculateTotalPrice().toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentColor,
                        padding: const EdgeInsets.all(16),
                        side: const BorderSide(color: Colors.grey, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: orderViewModel.orders.isEmpty
                          ? null
                          : () {
                              Get.to(PaymentPage());
                            },
                      child: const Text(
                        'Order Now',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
