import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:flutter/material.dart';
import '../../utilities/string_constant.dart';
import '../../views/item_cart_child.dart';
import '../models/menu_model.dart';

class AddItemsPage extends StatefulWidget {
  final DataSubModel foodItem;
  const AddItemsPage({super.key, required this.foodItem});

  @override
  AddItemsPageState createState() => AddItemsPageState();
}

class AddItemsPageState extends State<AddItemsPage> {
  String itemName = Texts.empty();
  int itemQuantity = 0;
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // for background transparent
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[900],
        title: const Text('Add Items'),
      ),
      body: Stack(
        children: [
          //MARK: Cart
          ItemCartChild(foodItem: widget.foodItem),

          Positioned(
            bottom: 44,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 64,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Ink(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Texts.minusIcon()),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      child: const SizedBox(height: 30, width: 30),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_itemCount > 1) {
                          _itemCount--;
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '$_itemCount',
                    style: const TextStyle(),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    icon: Ink(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Texts.plusIcon()),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      child: const SizedBox(height: 30, width: 30),
                    ),
                    onPressed: () {
                      setState(() {
                        _itemCount++;
                      });
                    },
                  ),
                  const SizedBox(width: 32.0),

                  //MARK: Button Cart
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add item to cart and navigate back to previous screen
                        }, // need total iteam
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            return AppColors.darkBlue;
                          }),
                        ),
                        child: Text('${Texts.txtCart()} - \$200'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
