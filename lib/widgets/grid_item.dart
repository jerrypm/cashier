import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/product_type.dart';

//Mark: Change UI Grid OR List
GridTile getGridItem(ItemArrayList item, ViewType viewType) {
  return GridTile(
    child: (viewType == ViewType.list)
        //MARK: List Data
        ? Container(
            margin: const EdgeInsets.all(2),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(item.imageUrl),
              ),
              title: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                item.price,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              trailing: Container(
                width: 90,
                height: 40,
                child: Row(
                  children: [
                    //Icon Minus
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                        border: Border.all(color: Colors.blueAccent),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Icon(
                        CupertinoIcons.minus,
                        size: 18,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text("0"),
                    ),

                    //Icon Minus
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                        border: Border.all(color: Colors.blueAccent),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Icon(
                        CupertinoIcons.plus,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        //MARK: Grid Data
        : Container(
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
                const SizedBox(height: 5),
              ],
            ),
          ),
  );
}
