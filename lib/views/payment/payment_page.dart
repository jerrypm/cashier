import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utilities/string_constant.dart';
import '../../utilities/color_custom.dart';
import '../../view_models/main_view_models.dart';

class PaymentPage extends StatelessWidget {
  final CartController _controller = Get.put(CartController());
  final TextEditingController _customerMoneyController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: AppBar
      appBar: AppBar(
        elevation: 0, // for background transparent
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: Colors.grey[900],
        title: Text(Texts.titlePayment()),
      ),

      //MARK: Main background
      backgroundColor: AppColors.backgroundColor,

      //MARK: Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Sub Total',
                              style: TextStyle(fontSize: 14),
                            ),
                            Spacer(),
                            Text(
                              '${_controller.totalOrder}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Tax(10%)',
                              style: TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            Text(
                              '${_controller.totalOrder}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(fontSize: 14),
                            ),
                            Spacer(),
                            Text(
                              '${_controller.totalOrder}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _customerMoneyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Customer Money',
                ),
              ),
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: () {
                    double customerMoney =
                        double.parse(_customerMoneyController.text);
                    _controller.processPayment(customerMoney);
                  },
                  child: Text('Process Payment'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor.withOpacity(0.6),
                    minimumSize: Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          22), // Setengah dari tinggi button
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //line bottom
    );
  }
}
