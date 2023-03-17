import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:cashier_mate/views/add_item_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/product_type.dart';

//Mark: Change UI Grid OR List
GridTile getGridItem(ItemArrayList item, ViewType viewType) {
  return GridTile(
    // ignore: sort_child_properties_last
    child: GestureDetector(
      onTap: () {
        Get.to(AddItemsPage());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 2),
          boxShadow: const [
            BoxShadow(
              color: AppColors.darkPurple,
              blurRadius: 24,
              offset: Offset(0, 11),
            ),
          ], // Tambahkan border di sini
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.network(
              item.imageUrl,
            ),
          ),
        ),
      ),
    ),

    footer: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.quartz,
            spreadRadius: 1,
            blurRadius: 24,
            offset: Offset(0, 3),
          ),
        ], // Tambahkan border di sini
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(
          backgroundColor: AppColors.cultured,
          title: Text(
            item.title,
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontSize: 12,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text(
            item.price,
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
