import 'package:flutter/material.dart';
import '../../view_models/main_view_models.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final HomeViewModel viewModel = HomeViewModel();

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
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                viewModel.navigationLogout(context);
              },
              child: const Text("logout"),
            ),
          ),
        ],
      ),
    );
  }
}
