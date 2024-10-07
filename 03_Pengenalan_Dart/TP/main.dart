import 'package:flutter/material.dart';

void main() {
  runApp(WisataApp());
}

class WisataApp extends StatelessWidget {
  @override
  widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Wisata(),
    );
  }
}

class Wisata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 178, 255),
        title: Align(
            alignment: Alignment.center,
            child: Text(
              "Rekomendasi Wisata",
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pantai Menganti',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Image.network(
              'https://bams.jambiprov.go.id/wp-content/uploads/2023/09/Pantai-Menganti-Kebumen-1.png',
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Pantai Menganti merupakan sebuah pantai yang berlokasi di Desa Karangduwur, Kecamatan Ayah, Kabupaten Kebumen, Jawa Tengah. Bentang alam pada Pantai Menganti terdiri dari perbukitan dan pasir putih. Sejak tahun 2011, Pantai Menganti menjadi tempat wisata dan selancar, sekaligus pelabuhan dan pelelangan ikan.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol ditekan
              },
              child: Text('Kunjungi Tempat'),
            ),
          ],
        ),
      ),
    );
  }
}
