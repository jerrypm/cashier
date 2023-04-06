import 'package:flutter/material.dart';
import '../widgets/tab_item.dart';

enum FoodCategory {
  burger,
  pizza,
  sandwich,
  salad,
  chick,
}

class TabsItemsbarIcon {
  final Function(FoodCategory) onTap;
  TabsItemsbarIcon({required this.onTap});

  List<Widget> get tabs {
    return [
      TabItems(
          iconPath: 'assets/filters/01-hamburger.png',
          onTap: onTap,
          category: FoodCategory.burger),
      const Spacer(),
      TabItems(
          iconPath: 'assets/filters/02-pizza-thin.png',
          onTap: onTap,
          category: FoodCategory.pizza),
      const Spacer(),
      TabItems(
          iconPath: 'assets/filters/03-bread.png',
          onTap: onTap,
          category: FoodCategory.sandwich),
      const Spacer(),
      TabItems(
          iconPath: 'assets/filters/04-vegetables.png',
          onTap: onTap,
          category: FoodCategory.salad),
      const Spacer(),
      TabItems(
          iconPath: 'assets/filters/05-chicken.png',
          onTap: onTap,
          category: FoodCategory.chick),
    ];
  }
}
