import 'package:flutter/material.dart';
import 'main_page.dart';
import 'biodata_page.dart';
import 'detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MainPage(),
      routes: {
        '/biodata': (context) => BiodataPage(),
        '/detail': (context) => DetailPage(),
      },
    );
  }
}
