import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart'; // DateFormat

import '../../Utilities/string_constant.dart';
import '../../models/transaction_model.dart';
import '../../utilities/color_custom.dart';
import '../../widgets/dotted_line_dart.dart';

class Item {
  final String name;
  final double price;

  Item({required this.name, required this.price});
}

class HistoryDetails extends StatelessWidget {
  final Transaction transactions;

  const HistoryDetails({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: backgound
      backgroundColor: AppColors.backgroundColor,

      //MARK: AppBar
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: Colors.grey[900],
        elevation: 0,
        title: Text(
          transactions.queueNumber ?? "",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${Texts.txtTotalHistory()} \$${transactions.totalPrice}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 16),
            Text(
              DateFormat(Texts.dateFormat()).format(
                transactions.date ?? DateTime.now(),
              ),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),

            //Custom Line
            CustomPaint(
              size: const Size(double.infinity, 2.0),
              painter: DottedLinePainter(
                dashLength: 8.0,
                dashGapLength: 4.0,
                lineThickness: 2.0,
                lineColor: Colors.grey,
              ),
            ),

            const SizedBox(height: 16),

            //MARK: List item
            Expanded(
              child: ListView.builder(
                itemCount: transactions.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${transactions.data[index].title}'),
                    subtitle: Column(
                      children: [
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            const Icon(CupertinoIcons.money_dollar_circle),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                                '\$${transactions.data[index].price} (x${transactions.data[index].items})'),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            const Icon(CupertinoIcons.doc_text),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text("- ${transactions.data[index].note}"),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          transactions.data[index].imageUrl ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            //Custom Line
            CustomPaint(
              size: const Size(double.infinity, 2.0),
              painter: DottedLinePainter(
                dashLength: 8.0,
                dashGapLength: 4.0,
                lineThickness: 2.0,
                lineColor: Colors.grey,
              ),
            ),

            const SizedBox(height: 16),

            //MARK: Bottom Button

            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.accentColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(22.0),
                    ),
                  ),
                  foregroundColor: Colors.white,
                ),
                child: SizedBox(
                  height: 44.0,
                  child: Center(
                    child: Text(
                      Texts.close(),
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
