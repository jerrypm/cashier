import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utilities/string_constant.dart';
import '../../utilities/local_storage.dart';
import '../../views/item_cart_child.dart';
import '../models/menu_model.dart';
import '../models/order_model.dart';

class AddItemsPage extends StatefulWidget {
  final DataSubModel foodItem;
  const AddItemsPage({super.key, required this.foodItem});

  @override
  AddItemsPageState createState() => AddItemsPageState();
}

class AddItemsPageState extends State<AddItemsPage> {
  final localStorage = LocalStorage();
  String itemName = Texts.empty();
  int itemQuantity = 0;
  int _itemCount = 1;
  String _note = Texts.empty();
  String _total = Texts.empty();

  void _handleNoteChanged(String note) {
    setState(() {
      _note = note;
    });
  }

  void _handleTotal() {
    setState(() {
      String total = (widget.foodItem.price! * _itemCount).toStringAsFixed(2);
      _total = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: AppBar
      appBar: AppBar(
        elevation: 0, // for background transparent
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: Colors.grey[900],
        title: Text(Texts.titleItem()),
      ),

      //MARK: Main background
      backgroundColor: AppColors.backgroundColor,

      body: Stack(
        children: [
          //MARK: Cart Data
          ItemCartChild(
            foodItem: widget.foodItem,
            onNoteChanged: _handleNoteChanged,
          ),

          //MARK: Action Button
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
                          _handleTotal();
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
                        _handleTotal();
                      });
                    },
                  ),
                  const SizedBox(width: 32.0),

                  //MARK: Button Cart
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Add item to cart and navigate back to previous screen
                          Get.back();

                          final order = Order(
                            note: _note,
                            imageUrl: widget.foodItem.imageUrl,
                            title: widget.foodItem.title,
                            desc: widget.foodItem.desc,
                            items: _itemCount,
                            totalPrice: double.parse(_total),
                            date: DateTime.now(),
                          );
                          await localStorage.saveOrder(order);
                          setState(() {});
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
                            return AppColors.secondaryColor;
                          }),
                        ),
                        child: Text(
                            '${Texts.txtCart()} - \$${_total.isEmpty ? widget.foodItem.price : _total}'),
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
