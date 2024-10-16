import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // Bagian Header tanpa melengkung dengan nuansa coklat muda
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xFFD2B48C), // Warna coklat muda
              ),
              child: const Center(
                child: Text(
                  'Rekomendasi Wisata di Banyumas',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Bagian konten daftar wisata dengan deskripsi
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: wisataBanyumasImages.length, // Panjang list image
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8.0), // Tambah margin
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.brown.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // Posisi shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          /// Gambar wisata
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                30), // Sudut melengkung lebih halus
                            child: Container(
                              padding: const EdgeInsets.all(
                                  8.0), // Menambahkan padding di sekitar gambar
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    30), // Sama dengan ClipRRect
                                color: Colors
                                    .white, // Warna latar belakang agar terlihat jelas
                              ),
                              child: Image.network(
                                wisataBanyumasImages[
                                    index], // Ambil gambar sesuai indeks
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.image_not_supported,
                                    size: 150,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                          ),
                          // Nama dan Deskripsi Wisata
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    wisataBanyumasTitles[
                                        index], // Tampilkan title sesuai indeks
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color(0xFF8B4513), // Warna coklat tua
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Jarak antara title dan deskripsi
                                  _buildDescription(
                                      wisataBanyumasDescriptions[index]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun deskripsi
  Widget _buildDescription(String description) {
    const int maxLines = 2; // Batas jumlah baris

    return Text(
      description,
      maxLines: maxLines,
      overflow:
          TextOverflow.ellipsis, // Tambah elipsis jika lebih dari dua baris
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black, // Warna teks deskripsi agar lebih jelas
      ),
    );
  }
}

// Daftar gambar wisata di Banyumas
final List<String> wisataBanyumasImages = [
  'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcRKDQQ1xRt7zQrFBFKaKQBUrQEQy9aa11VOdskTepiHTDRpSnv95gIiys4gfjqmTK8zwvyqu5Nl9ffBMMWGTNU1_zmISGhTPrqrxGlRZA',
  'https://lh5.googleusercontent.com/p/AF1QipNPHridL3nzxEX4MgylxK3kNSwKeFqi7Z0X-taM=w810-h468-n-k-no',
  'https://lh5.googleusercontent.com/p/AF1QipMsQhKJbVHam8gSMCVVVeGfid2YOMGZ0M6KtvQt=w810-h468-n-k-no',
  'https://lh5.googleusercontent.com/p/AF1QipNoO_1prFxo5Xn4OdjNMvReMgBZrw_gwzFdjND7=w810-h468-n-k-no',
];

// Daftar title wisata di Banyumas
final List<String> wisataBanyumasTitles = [
  'Curug Cipendok',
  'Pancuran Pitu Baturaden',
  'Telaga Sunyi',
  'Hutan Pinus Limpakuwus',
];

// Daftar deskripsi wisata di Banyumas
final List<String> wisataBanyumasDescriptions = [
  'Curug Cipendok adalah air terjun megah setinggi 92 meter yang terletak di Banyumas, dikelilingi oleh hutan tropis yang lebat dan alami. Keindahan alamnya yang menakjubkan menjadikan tempat ini sebagai salah satu destinasi wisata alam yang populer di daerah ini. Suara gemericik air yang jatuh menciptakan melodi alam yang menenangkan, sementara pepohonan hijau yang rimbun memberikan suasana sejuk dan segar. Pengunjung dapat menikmati berbagai aktivitas, seperti trekking menuju air terjun dan bersantai sambil menikmati pemandangan spektakuler. Tak hanya itu, Curug Cipendok juga menjadi lokasi yang ideal untuk fotografi, di mana setiap sudutnya menawarkan latar belakang yang indah dan menakjubkan.',
  'Pancuran Pitu Baturaden adalah sumber air panas alami yang terkenal dengan manfaat kesehatannya, terletak di kawasan pegunungan Baturaden yang sejuk dan asri. Tempat ini terdiri dari tujuh pancuran dengan air yang mengandung mineral yang baik untuk kesehatan, sehingga banyak pengunjung yang datang untuk merasakan kehangatan dan kesegaran airnya. Selain berfungsi sebagai tempat relaksasi, Pancuran Pitu juga menawarkan pemandangan alam yang memukau, di mana pengunjung dapat menikmati udara segar pegunungan sambil berendam. Dikelilingi oleh hutan dan perbukitan, pengalaman di Pancuran Pitu tidak hanya memberikan manfaat kesehatan, tetapi juga ketenangan jiwa yang sulit ditemukan di tempat lain.',
  'Telaga Sunyi adalah sebuah danau kecil yang tersembunyi di tengah hutan Baturaden, dikenal dengan airnya yang jernih dan suasana yang tenang. Keindahan dan ketenangan Telaga Sunyi membuatnya menjadi tempat pelarian yang sempurna dari hiruk-pikuk kehidupan sehari-hari. Air danau yang berkilau dipantulkan oleh sinar matahari, menciptakan panorama yang sangat menawan. Dikelilingi oleh pepohonan dan flora yang rimbun, pengunjung dapat menikmati waktu bersantai di tepi danau, melakukan piknik, atau sekadar merenung dalam suasana damai. Telaga Sunyi juga merupakan lokasi yang ideal bagi para penggemar fotografi dan pecinta alam yang ingin menangkap keindahan alam yang autentik.',
  'Hutan Pinus Limpakuwus adalah kawasan wisata yang menawarkan pemandangan hutan pinus yang sejuk dan alami, menjadikannya lokasi yang sangat populer untuk kegiatan berkemah dan berswafoto. Dengan udara yang segar dan aroma khas pinus, hutan ini menawarkan pengalaman yang menyegarkan bagi para pengunjung. Trekking di antara pepohonan tinggi dan rimbun memberikan kesempatan untuk menjelajahi keindahan alam dan menikmati ketenangan yang ditawarkan oleh hutan. Selain itu, banyak spot foto menarik yang bisa ditemukan di dalam kawasan ini, membuat Hutan Pinus Limpakuwus menjadi tempat yang sempurna untuk mengabadikan momen indah bersama teman atau keluarga. Suasana yang tenang dan keindahan alamnya menjadikan tempat ini sebagai tujuan ideal bagi siapa saja yang ingin menjauh dari kesibukan dan menikmati kedamaian alam.',
];
