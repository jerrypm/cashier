import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utilities/string_constant.dart';
import '../../utilities/color_custom.dart';
import '../../view_models/cart_view_models.dart';
import '../../widgets/button_item.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final CartController _controller = Get.put(CartController());
  String _calculation = '';

  void _addToCalculation(String value) {
    setState(() {
      _calculation += value;
    });
  }

  void _calculateResult(double totalOrder) {
    double result = totalOrder - double.parse(_calculation);
    debugPrint("${result} here here");
    _controller.processPayment(result);
  }

  @override
  Widget build(BuildContext context) {
    double order = _controller.totalOrder;
    double tax = (_controller.totalOrder * 0.1);
    double totalOrder = order + tax;

    return Scaffold(
      //MARK: AppBar
      appBar: AppBar(
        elevation: 0, // for background transparent
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: Colors.grey[900],
        title: Text(
          Texts.titlePayment(),
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                  const SizedBox(
                    height: 22.0,
                  ),
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    color: AppColors.secondaryColor.withOpacity(0.1),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Sub Total',
                              style: TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            Text(
                              '\$${order.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 14),
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
                              '\$${tax.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 14),
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
                            const Spacer(),
                            Text(
                              '\$${totalOrder.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: TextEditingController(text: _calculation),
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Customer Money',
                  hintText: '0',
                  labelStyle: TextStyle(
                    fontSize: 17.0,
                    height: 0.1,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 44,
                ),
              ),
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: _calculation.isNotEmpty &&
                          double.parse(_calculation) >= totalOrder
                      ? () {
                          _calculateResult(totalOrder);
                        }
                      : null,
                  child: Text('Process Payment'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor.withOpacity(0.6),
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Row(
                children: [
                  _buildButton('7'),
                  const SizedBox(width: 8),
                  _buildButton('8'),
                  const SizedBox(width: 8),
                  _buildButton('9'),
                  const SizedBox(width: 8),
                  _buildButton('0'),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  _buildButton('4'),
                  const SizedBox(width: 8),
                  _buildButton('5'),
                  const SizedBox(width: 8),
                  _buildButton('6'),
                  const SizedBox(width: 8),
                  _buildDeleteButton(''),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  _buildButton('1'),
                  const SizedBox(width: 8),
                  _buildButton('2'),
                  const SizedBox(width: 8),
                  _buildButton('3'),
                  const SizedBox(width: 8),
                  _buildDeleteButton('C'),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  _buildButton('000'),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),

      //line bottom
    );
  }

  Widget _buildButton(String label) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          _addToCalculation(label);
        },
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor.withOpacity(0.4),
          minimumSize: const Size(double.infinity, 44),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Setengah dari tinggi button
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(String value) {
    return DeleteButton(
      buttonText: value,
      onPressed: () {
        setState(() {
          if (value.isEmpty) {
            _calculation = _calculation.substring(0, _calculation.length - 1);
          } else {
            _calculation = '';
          }
        });
      },
      isDeleteButton: value.isEmpty ? true : false,
    );
  }
}
