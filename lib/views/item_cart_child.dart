import 'package:flutter/material.dart';
import '../../utilities/string_constant.dart';
import '../models/menu_model.dart';

class ItemCartChild extends StatefulWidget {
  final DataSubModel foodItem;
  const ItemCartChild({super.key, required this.foodItem});

  @override
  ItemCartChildPage createState() => ItemCartChildPage();
}

class ItemCartChildPage extends State<ItemCartChild> {
  // ignore: unused_field
  String _note = Texts.empty();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
                  label: Text(ingredient),
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
              },
              decoration: InputDecoration(
                labelText: Texts.txtNote(),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.note),
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
