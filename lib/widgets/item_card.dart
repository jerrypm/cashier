import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ItemCardWidget extends Card {
  ItemCardWidget({
    Key? key,
    required BuildContext context,
    String? imageUrl,
    String? title,
    String? price,
  }) : super(
          key: key,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          imageUrl.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              title.toString(),
                              maxLines: 3,
                              // overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(
                              price.toString(),
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
