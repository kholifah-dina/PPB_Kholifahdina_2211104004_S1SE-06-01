// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../../models/dummy_data.dart';
import '../../widget/product_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Robot Produk'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: DUMMY_PRODUCTS.length,
        itemBuilder: (ctx, i) => ProductItem(
          id: DUMMY_PRODUCTS[i].id,
          title: DUMMY_PRODUCTS[i].title,
          imageUrl: DUMMY_PRODUCTS[i].imageUrl,
        ),
      ),
    );
  }
}
