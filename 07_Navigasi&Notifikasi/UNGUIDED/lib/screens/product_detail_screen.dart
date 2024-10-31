// lib/screens/product_detail_screen.dart
import 'package:flutter/material.dart';
import '../../models/dummy_data.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;

  ProductDetailScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    final product = DUMMY_PRODUCTS.firstWhere((prod) => prod.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Image.network(product.imageUrl),
          SizedBox(height: 10),
          Text(
            '\$${product.price}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            product.description,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
