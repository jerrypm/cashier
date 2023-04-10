import 'package:cashier_mate/utilities/color_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/string_constant.dart';
import '../../models/menu_model.dart';

class ItemCartChild extends StatefulWidget {
  final DataSubModel foodItem;
  final Function(String) onNoteChanged;
  const ItemCartChild(
      {super.key, required this.foodItem, required this.onNoteChanged});

  @override
  ItemCartChildPage createState() => ItemCartChildPage();
}

class ItemCartChildPage extends State<ItemCartChild> {
  // ignore: unused_field
  String _note = Texts.empty();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, bottom: 24, right: 24, top: 8),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //MARK: Image
            Container(
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.blueGrey.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(widget.foodItem.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            //MARK: detail food
            Text(
              widget.foodItem.title!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              widget.foodItem.desc!,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 16),

            // list ingredient here
            Text(
              Texts.txtIngredients(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.foodItem.ingredient!.map((ingredient) {
                return Chip(
                  label: Text(
                    ingredient,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: AppColors.secondaryColor.withOpacity(0.6),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            //MARK: Note
            TextField(
              onChanged: (value) {
                setState(() {
                  _note = value;
                });
                widget.onNoteChanged(value);
              },
              decoration: InputDecoration(
                hintText: Texts.txtNote(),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.secondaryColor.withOpacity(0.6)),
                ),
                prefixIcon: Icon(
                  CupertinoIcons.doc_text,
                  color: AppColors.secondaryColor.withOpacity(0.6),
                ),
              ),
              minLines: 1,
              maxLines: 7,
            ),
            const SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}
