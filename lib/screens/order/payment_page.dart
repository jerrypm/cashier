import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utilities/string_constant.dart';
import '../../models/transaction_model.dart';
import '../../utilities/color_custom.dart';
import '../../view_models/cart_view_models.dart';
import '../../widgets/button_item.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transactions;
  const PaymentPage({Key? key, required this.transactions}) : super(key: key);

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
    double result = double.parse(_calculation) - totalOrder;
    _controller.processPayment(
        widget.transactions, double.parse(_calculation), result);
  }

  @override
  Widget build(BuildContext context) {
    double order = widget.transactions.totalPrice;
    double tax = widget.transactions.tax;
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
                  Text(
                    Texts.txtOrder(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
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
                            Text(
                              Texts.txtSubTot(),
                              style: const TextStyle(fontSize: 14),
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
                            Text(
                              Texts.txtTax(),
                              style: const TextStyle(fontSize: 14),
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
                            Text(
                              Texts.txtTotal(),
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            Text(
                              '\$${totalOrder.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 14),
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
                decoration: InputDecoration(
                  labelText: Texts.txtCCash(),
                  hintText: '0',
                  labelStyle: const TextStyle(
                    fontSize: 17.0,
                    height: 0.1,
                    color: Colors.grey,
                  ),
                  focusedBorder: const UnderlineInputBorder(
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor.withOpacity(0.6),
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Text(Texts.txtPayment()),
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
    );
  }

  Widget _buildButton(String label) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          _addToCalculation(label);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor.withOpacity(0.4),
          minimumSize: const Size(double.infinity, 44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildDeleteButton(String value) {
    return DeleteButton(
      buttonText: value,
      onPressed: () {
        setState(() {
          if (_calculation.isNotEmpty) {
            if (value.isEmpty) {
              _calculation = _calculation.substring(0, _calculation.length - 1);
            } else {
              _calculation = '';
            }
          }
        });
      },
      isDeleteButton: value.isEmpty ? true : false,
    );
  }
}
