import 'package:cashier_mate/screens/history/history_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // DateFormat
import '../../Utilities/string_constant.dart';
import '../../utilities/color_custom.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> _dummyData = [
    // change here
    {
      'orderNumber': '#0001',
      'quantity': 2,
      'timestamp': DateTime(2022, 1, 1, 13, 0),
      'price': 50.00
    },
    {
      'orderNumber': '#0002',
      'quantity': 1,
      'timestamp': DateTime(2022, 1, 2, 10, 30),
      'price': 25.00
    },
    {
      'orderNumber': '#0003',
      'quantity': 3,
      'timestamp': DateTime(2022, 1, 3, 15, 45),
      'price': 75.00
    },
    {
      'orderNumber': '#0004',
      'quantity': 4,
      'timestamp': DateTime(2022, 1, 4, 14, 20),
      'price': 100.00
    },
    {
      'orderNumber': '#0005',
      'quantity': 2,
      'timestamp': DateTime(2023, 3, 30, 11, 10),
      'price': 50.00
    }
  ];

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
      body: _dummyData.isEmpty // change here
          ? Center(
              child: Image.asset(
                Texts.placeholderList(),
                width: 200,
                height: 200,
              ),
            )
          : ListView.builder(
              itemCount: _dummyData.length, // change here
              itemBuilder: (BuildContext context, int index) {
                String dateText;
                if (_dummyData[index]['timestamp'].isAfter(
                    DateTime.now().subtract(const Duration(days: 1)))) {
                  dateText = DateFormat('jm')
                      .format(_dummyData[index]['timestamp']); // change here
                } else {
                  dateText = DateFormat('dd MMM yyyy')
                      .format(_dummyData[index]['timestamp']); // change here
                }

                return InkWell(
                  onTap: () {
                    Get.to(HistoryDetails(
                      orderNumber: 21,
                      date: '2023-04-05',
                      transactionTotal: 22000.0,
                      items: [
                        Item(name: 'Item 1', price: 50.0),
                        Item(name: 'Item 2', price: 50.0),
                      ],
                    ));
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
                            'Orders: ${_dummyData[index]['orderNumber']}', // change here
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(flex: 16),
                          Text(
                              'Quantity: ${_dummyData[index]['quantity']}'), // change here
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
                            '\$${_dummyData[index]['price'].toStringAsFixed(2)}', // change here
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(flex: 16),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
