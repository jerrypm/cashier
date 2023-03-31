import 'package:cashier_mate/models/order_model.dart';
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
  final HomeViewModel orderViewModel = Get.put(HomeViewModel());

  double calculateTotalPrice() {
    return orderViewModel.orders
        .fold(0, (sum, product) => sum + product.totalPrice!);
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
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: orderViewModel.orders.length,
                  itemBuilder: (context, index) {
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
                                orderViewModel.orders[index].imageUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          orderViewModel.orders[index].title!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '\$${orderViewModel.orders[index].totalPrice}',
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
                              icon: Icon(Icons.delete_forever_outlined),
                              color: Colors.red,
                              onPressed: () async {
                                orderViewModel.deleteOrder(index);
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
                      'Total: \$${calculateTotalPrice()}',
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
                            // Proses pesanan dan navigasi ke halaman berikutnya
                          },
                    child: const Text(
                      'Order Now',
                      style: TextStyle(
                        fontSize: 18,
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
