import 'package:flutter/material.dart';
// untuk mengimport file lain yaitu list_view.dart
//import 'list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const LatihanListView(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        children: [
          // Membuat kotak 1
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 243, 210, 111),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.ac_unit),
                  SizedBox(height: 40),
                  const Text('Item 1'),
                ],
              ),
            ),
          ),
          // Membuat kotak 2
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 124, 235, 216),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_a_photo),
                  SizedBox(height: 40),
                  const Text('Item 1'),
                ],
              ),
            ),
          ),
          // Membuat kotak 4
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 124, 235, 216),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.icecream_outlined),
                  SizedBox(height: 40),
                  const Text('Item 1'),
                ],
              ),
            ),
          ),
          // Membuat kotak 4
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 231, 131, 190),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.accessible_forward_outlined),
                  SizedBox(height: 40),
                  const Text('Item 1'),
                ],
              ),
            ),
          ),
          // Tambahkan item lainnya jika diperlukan
        ],
      ),
    );
  }
}