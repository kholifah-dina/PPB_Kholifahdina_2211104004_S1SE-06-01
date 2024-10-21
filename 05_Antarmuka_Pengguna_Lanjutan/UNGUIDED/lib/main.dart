import 'package:flutter/material.dart';
import 'dart:ui'; // Import this to use BackdropFilter

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            // SliverAppBar as header
            SliverAppBar(
              expandedHeight: 250, // Height for a larger image background
              backgroundColor: const Color.fromARGB(
                  255, 189, 124, 54), // Solid brown background
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background image
                    Image.network(
                      'https://lh5.googleusercontent.com/p/AF1QipNMBJMKRWBsd5ZAfj5WwvfWWzFhXyiyPT2UAb7v=w810-h468-n-k-no',
                      fit: BoxFit.cover,
                    ),
                    // Apply blur effect
                    BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 5.0, sigmaY: 5.0), // Adjust blur strength
                      child: Container(
                        color: const Color(
                            0xAA8B4513), // Semi-transparent brown overlay
                      ),
                    ),
                  ],
                ),
                titlePadding:
                    const EdgeInsets.only(bottom: 16.0), // Adjust padding
                centerTitle: true,
                title: const Text(
                  'Rekomendasi Wisata di Banyumas',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 28, // Larger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              pinned: true, // Keep the title pinned when scrolling
            ),

            // SliverList for the list of tourist spots
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

  // Function to build the tourist card
  Widget _buildTourCard(BuildContext context, int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = screenWidth * 0.3; // 30% of screen width

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section on the left with padding and dynamic size
          Padding(
            padding: const EdgeInsets.all(8.0), // Add padding around the image
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // Make the image corners rounded
              child: Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  color: Colors
                      .grey[200], // Background color to handle loading state
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

          // Text section on the right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    wisataBanyumasTitles[index],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B4513),
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: _buildDescription(wisataBanyumasDescriptions[index]),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        _showDetails(context, index);
                      },
                      child: const Text(
                        'Selengkapnya',
                        style: TextStyle(
                          color: Color(0xFF8B4513),
                          fontWeight: FontWeight.bold,
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
    );
  }

  // Function to build the description
  Widget _buildDescription(String description) {
    const int maxLines = 3; // Increased max lines

    return Text(
      description,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  // Show details when the "Selengkapnya" button is pressed
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
  'https://lh5.googleusercontent.com/p/AF1QipMsQhKJbVHam8gSMCVVVeGfid2YOMGZ0M6KtvQt=w810-h468-n-k-no',
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
  'Curug Cipendok adalah air terjun megah setinggi 92 meter yang terletak di Banyumas. Tempat ini menawarkan pemandangan alam yang indah dan udara yang sejuk. Cocok untuk para pecinta alam dan fotografi. Banyak pengunjung yang datang untuk menikmati keindahan alam di sekitar air terjun ini dan berfoto di spot-spot menarik.',
  'Pancuran Pitu Baturaden adalah sumber air panas alami yang terkenal dengan manfaat kesehatannya. Banyak pengunjung yang datang untuk merasakan kesegaran air panas dan menikmati pemandangan sekitar. Sumber air panas ini juga memiliki kolam-kolam kecil yang dapat digunakan untuk berendam, memberikan pengalaman relaksasi yang menyegarkan.',
  'Telaga Sunyi adalah sebuah danau kecil yang tersembunyi di tengah hutan Baturaden. Tempat ini sangat tenang dan cocok untuk bersantai serta menikmati keindahan alam. Suasana yang damai dan jauh dari keramaian membuatnya ideal untuk meditasi atau sekadar menikmati alam. Banyak pengunjung yang membawa makanan piknik dan menghabiskan waktu di sini.',
  'Hutan Pinus Limpakuwus adalah kawasan wisata yang menawarkan pemandangan hutan pinus yang sejuk dan menenangkan. Pengunjung bisa berjalan-jalan di antara pepohonan pinus dan menikmati udara segar. Terdapat jalur trekking yang bisa dijelajahi, serta area untuk berkemah bagi mereka yang ingin merasakan suasana malam di tengah hutan. Hutan ini juga sering dijadikan lokasi foto pre-wedding karena keindahan alamnya.',
];
