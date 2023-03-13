import 'package:flutter/material.dart';
import 'package:get/get.dart';

//MARK: Alert Normal Dialog
Future<void> showConfirmationDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

//MARK: Alert SnackBar
class CustomSnackBar {
  CustomSnackBar(BuildContext context, Widget content,
      {SnackBarAction? snackBarAction, Color backgroundColor = Colors.red}) {
    final SnackBar snackBar = SnackBar(
        action: snackBarAction,
        backgroundColor: backgroundColor,
        content: content,
        behavior: SnackBarBehavior.floating);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
