import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // for background transparent
        title: const Text("Settings"),
        foregroundColor: Colors.grey[900],
        backgroundColor: Colors.white,
        actions: const [],
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
