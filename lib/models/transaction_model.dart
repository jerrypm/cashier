import 'dart:convert';
import '../models/order_model.dart';

class Transaction {
  final List<Order> data;
  final double tax;
  final double totalPrice;
  final DateTime? date;
  final String? quantity;
  final String? queueNumber;

  Transaction({
    required this.data,
    required this.tax,
    required this.totalPrice,
    required this.date,
    required this.quantity,
    required this.queueNumber,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        data: (json['data'] as List)
            .map((orderJson) => Order.fromJson(orderJson))
            .toList(),
        tax: json['tax'],
        totalPrice: json['total_price'],
        date: DateTime.parse(json['date']),
        quantity: json['quantity'],
        queueNumber: json['queueNumber']);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((order) => order.toJson()).toList(),
      'tax': tax,
      'total_price': totalPrice,
      'date': date,
      'quantity': quantity,
      'queueNumber': queueNumber,
    };
  }

  static Transaction fromJsonString(String jsonString) {
    return Transaction.fromJson(json.decode(jsonString));
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}
