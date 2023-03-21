// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../view_models/main_view_models.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsScreen> {
  bool _notificationsEnabled = false;
  final HomeViewModel viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Settings"),
        foregroundColor: Colors.grey[900],
        backgroundColor: Colors.white,
        actions: const [],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Enable Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Change Theme'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Terms of Service'),
            onTap: () {},
          ),
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
