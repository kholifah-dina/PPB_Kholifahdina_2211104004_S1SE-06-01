import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              backgroundColor: const Color(0xFFD2B48C),
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Rekomendasi Wisata di Banyumas',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buildTourCard(context, index);
                },
                childCount: wisataBanyumasImages.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTourCard(BuildContext context, int index) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: width * 0.35,
                  height: width * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  child: Image.network(
                    wisataBanyumasImages[index],
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
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Memusatkan teks secara vertikal
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Memusatkan teks secara horizontal
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Text(
                          wisataBanyumasTitles[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: constraints.maxWidth *
                                0.07, // Memperbesar ukuran teks
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF8B4513),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                        height:
                            10), // Spasi antar elemen untuk menghindari kesan sepi
                    _buildDescription(wisataBanyumasDescriptions[index]),
                    const SizedBox(
                        height: 15), // Spasi sebelum tombol 'Selengkapnya'
                    Center(
                      child: TextButton(
                        onPressed: () {
                          _showDetails(context, index);
                        },
                        child: Text(
                          'Selengkapnya',
                          style: TextStyle(
                            color: const Color(0xFF8B4513),
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(String description) {
    const int maxLines = 2;

    return Text(
      description,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    );
  }

  void _showDetails(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(wisataBanyumasTitles[index]),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    wisataBanyumasImages[index],
                    height: 150,
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
                const SizedBox(height: 10),
                Text(
                  wisataBanyumasDescriptions[index],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// List of tourist spot images in Banyumas
final List<String> wisataBanyumasImages = [
  'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcRKDQQ1xRt7zQrFBFKaKQBUrQEQy9aa11VOdskTepiHTDRpSnv95gIiys4gfjqmTK8zwvyqu5Nl9ffBMMWGTNU1_zmISGhTPrqrxGlRZA',
  'https://lh5.googleusercontent.com/p/AF1QipNPHridL3nzxEX4MgylxK3kNSwKeFqi7Z0X-taM=w810-h468-n-k-no',
  'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQku5LxD9shT7acJALX9krJ2QOGqP8feEi7fA4lKfUfQKmCjU0bvx_m1nfxK3fhx3k57EqK_TXQ3yyLak0Qt14W-N4_PDegs3Y34tW5wXc',
  'https://lh5.googleusercontent.com/p/AF1QipNoO_1prFxo5Xn4OdjNMvReMgBZrw_gwzFdjND7=w810-h468-n-k-no',
];

// List of titles for tourist spots in Banyumas
final List<String> wisataBanyumasTitles = [
  'Curug Cipendok',
  'Pancuran Pitu Baturaden',
  'Telaga Sunyi',
  'Hutan Pinus Limpakuwus',
];

// List of descriptions for tourist spots in Banyumas
final List<String> wisataBanyumasDescriptions = [
  'Curug Cipendok adalah air terjun megah setinggi 92 meter yang terletak di Banyumas, menyuguhkan pemandangan alam yang menakjubkan dengan suara gemericik air yang menenangkan. Tempat ini dikelilingi oleh pepohonan hijau yang rimbun, menjadikannya sebagai lokasi ideal bagi para pecinta alam dan fotografer yang ingin menangkap keindahan alam yang masih alami. Suasana sejuk dan segar di sekitar air terjun membuat pengunjung betah berlama-lama, menikmati keindahan yang ditawarkan',
  'Pancuran Pitu Baturaden adalah sumber air panas alami yang terkenal dengan berbagai manfaat kesehatan, seperti meredakan pegal dan membantu relaksasi. Banyak pengunjung yang datang untuk merasakan kesegaran air panas yang dipercaya memiliki khasiat penyembuhan, sambil menikmati pemandangan alam yang memukau di sekitarnya. Tempat ini juga menyediakan fasilitas yang nyaman untuk mendukung pengalaman berendam yang lebih menyenangkan.',
  'Telaga Sunyi adalah sebuah danau kecil yang tersembunyi di tengah hutan Baturaden, menawarkan suasana yang tenang dan damai. Keberadaan danau ini dikelilingi oleh pepohonan yang lebat, menjadikannya tempat yang sangat ideal untuk bersantai dan menjauh dari hiruk-pikuk kehidupan sehari-hari. Di sini, pengunjung dapat menikmati keindahan alam sambil merenung atau hanya sekadar menikmati secangkir kopi dalam ketenangan.',
  'Hutan Pinus Limpakuwus adalah kawasan wisata yang menampilkan pemandangan hutan pinus yang sejuk dan menenangkan, di mana pengunjung bisa berjalan-jalan di antara pepohonan tinggi yang menjulang. Suasana hutan yang tenang memberikan kesempatan untuk bersantai, berinteraksi dengan alam, atau melakukan aktivitas luar ruang seperti trekking. Tempat ini sangat cocok bagi mereka yang ingin menikmati suasana alam yang asri dan menenangkan pikiran.',
];
