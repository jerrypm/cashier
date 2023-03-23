import 'package:flutter/material.dart';
import '../../utilities/color_custom.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryScreen> {
  List<Map<String, dynamic>> transactions = [
    {'id': 'T001', 'date': '2023-03-15', 'total': 10000},
    {'id': 'T002', 'date': '2023-03-16', 'total': 15000},
    {'id': 'T003', 'date': '2023-03-17', 'total': 12000},
    // Tambahkan lebih banyak data contoh jika perlu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: Main background
      backgroundColor: AppColors.backgroundColor,
      extendBodyBehindAppBar: true,

      //MARK: AppBar
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          'History',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),

      //MARK: Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(transactions[index]['id']),
                  ),
                  title: Text(transactions[index]['date']),
                  subtitle: Text('Total: Rp${transactions[index]['total']}'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
