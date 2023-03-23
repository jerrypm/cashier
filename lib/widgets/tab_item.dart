import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:flutter/material.dart';

class TabItems extends StatelessWidget {
  final String iconPath;
  final Function onTap;

  const TabItems({
    super.key,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
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
