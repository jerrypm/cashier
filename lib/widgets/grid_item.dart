import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:cashier_mate/views/add_item/add_item_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/product_type.dart';
import '../models/menu_model.dart';

//Mark: Change UI Grid OR List
GridTile getGridItem(DataSubModel item, ViewType viewType) {
  return GridTile(
    // ignore: sort_child_properties_last
    child: GestureDetector(
      onTap: () {
        Get.to(AddItemsPage(foodItem: item));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 6),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.withOpacity(0.3),
              blurRadius: 24,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        padding: const EdgeInsets.all(0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              ClipRRect(
                child: SizedBox(
                  width: 150,
                  height: 100,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(
                      item.imageUrl!,
                    ),
                  ),
                ),
              ),

              //MARK: Footer
              ClipRRect(
                child: GridTileBar(
                  backgroundColor: AppColors.cultured,
                  title: Text(
                    item.title!,
                    style: TextStyle(
                      color: Colors.blueGrey[700],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text(
                    '\$${item.price!}',
                    style: TextStyle(
                      color: Colors.blueGrey[700],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
