import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Biodata',
      debugShowCheckedModeBanner: false, // Menghilangkan garis kuning debug
      theme: ThemeData(
        primaryColor: Colors.brown[700],
        scaffoldBackgroundColor: const Color(0xFFF5F5DC), // Warna krem
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: const MyHomePage(title: 'My Profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 26, // Mengatur ukuran font
            fontWeight: FontWeight.w600, // Tebal font
            color: Colors.white, // Warna putih untuk judul
          ),
        ),

        centerTitle: true,
        backgroundColor: Colors.brown[700], // Warna coklat tua
        elevation: 0, // Menghilangkan bayangan
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                  '/lib/pas_foto.jpg'), // Ganti dengan path image lokal
              backgroundColor: Colors
                  .brown[100], // Warna coklat muda untuk background avatar
            ),
            const SizedBox(height: 20),
            const Text(
              'Nama: Kholifahdina',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown, // Ubah warna teks menjadi coklat
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Umur: 20',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54, // Warna lebih lembut
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Kelas: S1SE-06-01',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              thickness: 2,
              indent: 40,
              endIndent: 40,
              color: Colors.brown, // Divider coklat
            ),
            // Container untuk informasi tentang diri
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.brown[100], // Latar belakang coklat muda
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Bayangan hitam lembut
                    blurRadius: 10.0,
                    offset: const Offset(4.0, 4.0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Tentang Saya:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown, // Warna coklat
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Saya adalah mahasiswa S1 Software Engineering di Telkom University Purwokerto yang kini berada di semester 5. Saat ini, saya telah mempelajari dasar-dasar pengembangan perangkat lunak dan tengah mendalami materi lebih lanjut terkait rekayasa perangkat lunak untuk mempersiapkan diri menuju dunia profesional.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Spacer
            const Text(
              'You have clicked the button this many times:',
              style: TextStyle(color: Colors.black87),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.brown, // Ubah warna counter menjadi coklat
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.brown[700], // Warna coklat tua sesuai tema
        child: const Icon(Icons.add),
      ),
    );
  }
}
