import 'package:cashier_mate/utilities/string_constant.dart';
import 'package:cashier_mate/view_models/main_view_models.dart';
import 'package:cashier_mate/widgets/item_card.dart';
import 'package:cashier_mate/models/product_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeViewModel homeViewModel = HomeViewModel();
  List<ItemArrayList> listData = [
    ItemArrayList(
      imageUrl:
          "https://kbu-cdn.com/dk/wp-content/uploads/curcuma-fried-chicken.jpg",
      title: "Curcuma Fried Chicken",
      price: "Rp 14.000",
    ),
    ItemArrayList(
      imageUrl:
          "https://kbu-cdn.com/dk/wp-content/uploads/fire-chicken-wings.jpg",
      title: "Fire Chicken Wings",
      price: "Rp 22.000",
    ),
    ItemArrayList(
      imageUrl:
          "https://kbu-cdn.com/dk/wp-content/uploads/curcuma-fried-chicken.jpg",
      title: "Birier Fried Chicken",
      price: "Rp 14.000",
    ),
    ItemArrayList(
      imageUrl:
          "https://kbu-cdn.com/dk/wp-content/uploads/fire-chicken-wings.jpg",
      title: "Water Chicken Wings",
      price: "Rp 22.000",
    ),
    ItemArrayList(
      imageUrl:
          "https://kbu-cdn.com/dk/wp-content/uploads/curcuma-fried-chicken.jpg",
      title: "Kpop Fried Chicken",
      price: "Rp 14.000",
    ),
    ItemArrayList(
      imageUrl:
          "https://kbu-cdn.com/dk/wp-content/uploads/fire-chicken-wings.jpg",
      title: "Earth Chicken Wings",
      price: "Rp 22.000",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: Main background
      backgroundColor: Colors.white.withOpacity(0.9),

      // MARK: App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[900],
        title: Text(Texts.titleHome()),
      ),

      //MARK: Body
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: listData.length + 1,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                height: 100.0,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
              );
            } else {
              return ItemCardWidget(
                context: context,
                imageUrl: listData[index - 1].imageUrl,
                title: listData[index - 1].title,
                price: listData[index - 1].price,
              );
            }
          },
        ),
      ),
    );
  }
}
