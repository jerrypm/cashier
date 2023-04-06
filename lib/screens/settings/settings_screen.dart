// ignore_for_file: library_private_types_in_public_api

import 'package:cashier_mate/screens/settings/webview_screen.dart';
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
  final MainViewModel viewModel = Get.put(MainViewModel());

  //MARK: Body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: backgound
      backgroundColor: AppColors.backgroundColor,

      //MARK: App Bar
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Texts.titleSettings(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: Colors.grey[900],
        backgroundColor: AppColors.backgroundColor,
        actions: const [],
      ),

      //MARK: Body
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.secondaryColor.withOpacity(0.8),
                    child: Text(
                      viewModel.username.substring(0, 2).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          viewModel.username.value,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          viewModel.email.value,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(Texts.txtVersion()),
              trailing: Text(Texts.txtVersionValue()),
            ),
            const Divider(),
            ListTile(
              title: Text(Texts.txtPrivacy()),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: Text(Texts.txtWeb()),
              onTap: () {
                Get.to(WebViewScreen());
              },
            ),
            const Divider(),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor.withOpacity(0.6),
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  onPressed: () {
                    CustomDialog(
                      title: Texts.descMsgLogOut(),
                      subTitle: Texts.empty(),
                      cancelButton: ElevatedButton(
                        onPressed: () {
                          Get.back(result: false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(Texts.no()),
                      ),
                      deleteButton: ElevatedButton(
                        onPressed: () {
                          viewModel.navigationLogout(context);
                          Get.back(result: true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(Texts.yes()),
                      ),
                      radius: 10.0, // set custom radius
                    );
                  },
                  child: Text(Texts.logout()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
