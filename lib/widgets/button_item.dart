import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final bool isDeleteButton;

  DeleteButton(
      {required this.buttonText,
      required this.onPressed,
      this.isDeleteButton = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as void Function()?,
      child: Container(
        width: 80,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[300],
        ),
        padding: const EdgeInsets.all(4),
        child: isDeleteButton
            ? const Icon(Icons.backspace)
            : Center(child: Text(buttonText)),
      ),
    );
  }
}
