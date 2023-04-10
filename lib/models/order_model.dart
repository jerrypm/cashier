import 'dart:convert';

class Order {
  final String? note;
  final String? imageUrl;
  final String? title;
  final String? desc;
  final int? items;
  final double? price;
  final DateTime? date;

  Order({
    this.note,
    this.imageUrl,
    this.title,
    this.desc,
    this.items,
    this.price,
    this.date,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      note: json['note'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      desc: json['desc'],
      items: json['items'],
      price: json['price'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'note': note,
      'imageUrl': imageUrl,
      'title': title,
      'desc': desc,
      'items': items,
      'price': price,
      'date': date?.toIso8601String(),
    };
  }

  static Order fromJsonString(String jsonString) {
    return Order.fromJson(json.decode(jsonString));
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}
