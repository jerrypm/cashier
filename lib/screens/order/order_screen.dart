import 'package:flutter/material.dart';
import '../../utilities/color_custom.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends State<OrderScreen> {
  List<Map<String, dynamic>> products = [
    {'name': 'Produk A', 'price': 5000},
    {'name': 'Produk B', 'price': 10000},
    {'name': 'Produk C', 'price': 15000},
    // Tambahkan lebih banyak data contoh jika perlu
  ];

  Map<String, int> cart = {};

  void addToCart(String product) {
    setState(() {
      if (cart.containsKey(product)) {
        // cart[product] += 1;
      } else {
        cart[product] = 1;
      }
    });
  }

  int calculateTotal() {
    int sum = 0;
    cart.forEach((key, value) {
      final product = products.firstWhere((product) => product['name'] == key);
      sum += (value * product['price'] as int);
    });
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MARK: backgound
      backgroundColor: AppColors.backgroundColor,

      //MARK: AppBar
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          'Order',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),

      //MARK: Body
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(products[index]['name']),
                    subtitle: Text('Harga: Rp${products[index]['price']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () => addToCart(products[index]['name']),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: Rp${calculateTotal()}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: cart.isEmpty
                      ? null
                      : () {
                          // Proses pesanan dan navigasi ke halaman berikutnya
                        },
                  child: const Text('Pesan'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
