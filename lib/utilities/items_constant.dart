import 'package:flutter/material.dart';
import '../widgets/tab_item.dart';

class TabsItemsbar {
  List<Widget> tabs(Function onTap) => [
        TabItems(iconPath: 'assets/filters/01-hamburger.png', onTap: onTap),
        TabItems(iconPath: 'assets/filters/02-pizza-thin.png', onTap: onTap),
        TabItems(iconPath: 'assets/filters/03-bread.png', onTap: onTap),
        TabItems(iconPath: 'assets/filters/04-vegetables.png', onTap: onTap),
        TabItems(iconPath: 'assets/filters/05-chicken.png', onTap: onTap),
      ];
}
