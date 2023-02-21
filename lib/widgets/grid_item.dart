import 'package:flutter/material.dart';
import 'package:cashier_mate/models/product_type.dart';

//Mark: Change UI Grid OR List
GridTile getGridItem(ItemArrayList item, ViewType viewType) {
  return GridTile(
    child: (viewType == ViewType.list)
        //MARK: List Data
        ? Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(item.imageUrl)),
                const SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: const TextStyle(fontSize: 20)),
                    Text(item.price, style: const TextStyle(fontSize: 15)),
                  ],
                )
              ],
            ),
          )
        //MARK: Grid Data
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Image.network(item.imageUrl),
                ),
              )),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                item.title,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5)
            ],
          ),
  );
}
