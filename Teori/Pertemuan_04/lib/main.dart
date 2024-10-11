import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.grey,
        ),
        body: Column(
          children: [
            // Baris atas dengan teks dan lingkaran
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFE07A5F),
                        ),
                      ),
                      Text(
                        '2211104004 - Kholifahdina',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold, // Font tebal
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFF006400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Color(0xFFE07A5F),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
