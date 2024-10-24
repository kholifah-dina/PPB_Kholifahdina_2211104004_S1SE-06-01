import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Fungsi untuk mengubah halaman ketika icon di klik
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List halaman berdasarkan index
  static const List<Widget> _pages = [
    SafeArea(
      child: Align(
        alignment: Alignment.topLeft, // Menempatkan tulisan di kiri atas
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Memberikan padding
          child: Text('Home page', style: TextStyle(fontSize: 24)),
        ),
      ),
    ),
    SafeArea(
      child: Center(child: Text('Email page', style: TextStyle(fontSize: 24))),
    ),
    SafeArea(
      child:
          Center(child: Text('Profile page', style: TextStyle(fontSize: 24))),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Email'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.orange,
      ),
    );
  }
}
