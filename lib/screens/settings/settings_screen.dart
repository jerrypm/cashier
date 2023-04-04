// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utilities/string_constant.dart';
import '../../utilities/alert_dialog.dart';
import '../../utilities/color_custom.dart';
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
      //MARK: backgound
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: Colors.grey[900],
        backgroundColor: AppColors.backgroundColor,
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
                CustomDialog(
                  title: 'Are you sure you want to Logout?',
                  subTitle: Texts.empty(),
                  cancelButton: ElevatedButton(
                    onPressed: () {
                      Get.back(result: false);
                    },
                    child: Text('No'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  deleteButton: ElevatedButton(
                    onPressed: () {
                      viewModel.navigationLogout(context);
                      Get.back(result: true);
                    },
                    child: Text('Yes'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  radius: 10.0, // set custom radius
                );
              },
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
