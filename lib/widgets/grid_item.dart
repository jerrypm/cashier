import 'package:cashier_mate/views/add_item_page.dart';
import 'package:flutter/cupertino.dart';
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

    footer: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTileBar(
        backgroundColor: const Color.fromARGB(255, 245, 244, 244),
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
  );
}
