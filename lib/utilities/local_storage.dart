import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/order_model.dart';

class LocalStorage {
  static const String _ordersKey = 'orders';
  static const String _historyKey = 'history';

  //MARK: Save Order
  Future<void> saveOrder(Order order) async {
    final prefs = await SharedPreferences.getInstance();
    final orders = await getOrders();
    orders.add(order);
    final jsonString = json.encode(orders.map((e) => e.toJson()).toList());
    await prefs.setString(_ordersKey, jsonString);
  }

  //MARK: Get All List
  Future<List<Order>> getOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_ordersKey) ?? '[]';
    final jsonList = json.decode(jsonString) as List;
    return jsonList.map((e) => Order.fromJson(e)).toList();
  }

  //MARK: Delete All List
  Future<void> deleteOrder(Order order) async {
    final prefs = await SharedPreferences.getInstance();
    final orders = await getOrders();
    orders.remove(order);
    final jsonString = json.encode(orders.map((e) => e.toJson()).toList());
    await prefs.setString(_ordersKey, jsonString);
  }

  //MARK: Delete by index
  Future<void> deleteOrderAtIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final orders = await getOrders();
    orders.removeAt(index);
    final jsonString = json.encode(orders.map((e) => e.toJson()).toList());
    await prefs.setString(_ordersKey, jsonString);
  }

  // // Menyimpan riwayat transaksi
  // Future<void> saveTransaction(Transaction transaction) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final transactions = await getTransactions();
  //   transactions.add(transaction);
  //   final jsonString = json.encode(transactions.map((e) => e.toJson()).toList());
  //   await prefs.setString(_historyKey, jsonString);
  // }

  // // Mengambil semua riwayat transaksi
  // Future<List<Transaction>> getTransactions() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final jsonString = prefs.getString(_historyKey) ?? '[]';
  //   final jsonList = json.decode(jsonString) as List;
  //   return jsonList.map((e) => Transaction.fromJson(e)).toList();
  // }
}
