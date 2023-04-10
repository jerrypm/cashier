import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart'; // DateFormat

import 'package:cashier_mate/screens/history/history_detail_screen.dart';

import '../../Utilities/string_constant.dart';
import '../../utilities/color_custom.dart';
import '../../view_models/cart_view_models.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryScreen> {
  final CartController cartViewModel = Get.put(CartController());

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
          Texts.titleHistory(),
          style: const TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      //MARK: Body
      body: Obx(
        () => cartViewModel.transactionList.isEmpty
            ? Center(
                child: Image.asset(
                  Texts.placeholderList(),
                  width: 200,
                  height: 200,
                ),
              )
            : ListView.builder(
                itemCount: cartViewModel.transactionList.length,
                itemBuilder: (BuildContext context, int index) {
                  final reversedIndex =
                      cartViewModel.transactionList.length - 1 - index;
                  String dateText;
                  if (cartViewModel.transactionList[reversedIndex].date
                          ?.isAfter(DateTime.now()
                              .subtract(const Duration(days: 1))) ??
                      false) {
                    dateText = DateFormat(Texts.dateFormatTime()).format(
                        cartViewModel.transactionList[reversedIndex].date ??
                            DateTime.now());
                  } else {
                    dateText = DateFormat(Texts.dateFormat()).format(
                        cartViewModel.transactionList[reversedIndex].date ??
                            DateTime.now());
                  }

                  return InkWell(
                    onTap: () {
                      Get.to(HistoryDetails(
                          transactions:
                              cartViewModel.transactionList[reversedIndex]));
                    },
                    child: Container(
                      height: 72,
                      margin: const EdgeInsets.all(12.0),
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
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              '${Texts.titleOrders()} : ${cartViewModel.transactionList[reversedIndex].queueNumber}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(flex: 16),
                            Text(
                                '${Texts.txtQuantity()} : ${cartViewModel.transactionList[reversedIndex].quantity}'),
                            const Spacer(flex: 16),
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Spacer(),
                            Text(
                              '$dateText',
                              style: TextStyle(fontSize: 12.0),
                            ),
                            const Spacer(flex: 16),
                            Text(
                              '\$${cartViewModel.transactionList[reversedIndex].totalPrice.toStringAsFixed(1)}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(flex: 16),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
