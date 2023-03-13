import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // for background transparent
        title: const Text("Order"),
        foregroundColor: Colors.grey[900],
        backgroundColor: Colors.white,
        actions: const [],
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 50.0,
          )
        ],
      ),
      //batas cuy
    );
  }
}
