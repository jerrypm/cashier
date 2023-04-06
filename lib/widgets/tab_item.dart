import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:flutter/material.dart';

import '../utilities/items_constant.dart';

class TabItems extends StatelessWidget {
  final String iconPath;
  final Function(FoodCategory) onTap;
  final FoodCategory category;

  const TabItems({
    super.key,
    required this.iconPath,
    required this.onTap,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(category),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.withOpacity(0.3),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
          color: AppColors.secondaryColor.withOpacity(0.6),
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
