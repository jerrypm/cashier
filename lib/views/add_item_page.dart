import 'package:flutter/material.dart';

class AddItemsPage extends StatefulWidget {
  @override
  AddItemsPageState createState() => AddItemsPageState();
}

class AddItemsPageState extends State<AddItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[900],
        title: const Text('Add Items'),
      ),
      body: Container(
        height: 100.0,
      ),
    );
  }
}
