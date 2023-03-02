import 'package:flutter/material.dart';
import '../../models/product_type.dart';

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
                    Text(item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(item.price,
                        style: const TextStyle(
                          fontSize: 15,
                        )),
                  ],
                )
              ],
            ),
          )
        //MARK: Grid Data
        : Container(
            // color: Colors.amber,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      child: Image.network(item.imageUrl),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5)
              ],
            ),
          ),
  );
}
