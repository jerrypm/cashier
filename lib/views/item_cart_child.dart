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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              widget.foodItem.imageUrl!,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.foodItem.title!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            widget.foodItem.desc!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              setState(() {
                _note = value;
              });
            },
            decoration: InputDecoration(
              labelText: Texts.txtNote(),
              border: const OutlineInputBorder(),
            ),
            minLines: 3,
            maxLines: 5,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
