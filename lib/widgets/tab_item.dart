import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:flutter/material.dart';

class TabItems extends StatelessWidget {
  final String iconPath;

  const TabItems({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 50,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.darkBlue.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          iconPath,
          color: Colors.white,
        ),
      ),
    );
  }
}
