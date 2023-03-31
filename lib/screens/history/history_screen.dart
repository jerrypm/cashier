import 'package:flutter/material.dart';
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
      body: ListView.builder(
        itemCount: _dummyData.length,
        itemBuilder: (BuildContext context, int index) {
          String dateText;
          if (_dummyData[index]['timestamp']
              .isAfter(DateTime.now().subtract(const Duration(days: 1)))) {
            dateText = DateFormat('jm').format(_dummyData[index]['timestamp']);
          } else {
            dateText = DateFormat('dd MMM yyyy')
                .format(_dummyData[index]['timestamp']);
          }

          return Container(
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
                    'Orders: ${_dummyData[index]['orderNumber']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 16),
                  Text('Quantity: ${_dummyData[index]['quantity']}'),
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
                    '\$${_dummyData[index]['price'].toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
