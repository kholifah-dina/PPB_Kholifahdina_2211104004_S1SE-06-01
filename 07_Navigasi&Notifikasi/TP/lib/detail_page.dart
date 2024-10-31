import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.brown[50],
          border: Border.all(color: Colors.brown, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: Kholifahdina', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Umur: 21', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Alamat: Purwokerto', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Hobi: Membaca, Menulis', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Pendidikan: Mahasiswa IT Telkom Purwokerto', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
