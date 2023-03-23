import 'dart:convert';

class Order {
  final String? note;
  final String? imageUrl;
  final String? title;
  final String? desc;
  final int? items;
  final double? totalPrice;
  final DateTime? date;

  Order({
    this.note,
    this.imageUrl,
    this.title,
    this.desc,
    this.items,
    this.totalPrice,
    this.date,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      note: json['note'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      desc: json['desc'],
      items: json['items'],
      totalPrice: json['total_price'],
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
      'total_price': totalPrice,
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
