## LAPORAN MODUL 12 MAPS & PLACES

## Guided
### Penjelasan Program Guided

#### 1. **File `main.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:maps/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MapsScreen(),
    );
  }
}
```

**Penjelasan:**
- **`main.dart`**: Ini adalah titik awal dari aplikasi Flutter. Pada file ini, aplikasi dimulai dengan `runApp()` yang mengeksekusi widget `MyApp`.
- **`MaterialApp`**: Widget ini membungkus seluruh aplikasi dan menyediakan berbagai pengaturan dasar, seperti tema dan halaman utama.
  - **`colorScheme`** mengatur warna tema aplikasi menggunakan `Colors.deepPurple`.
  - **`home`** mengarahkan aplikasi untuk menampilkan widget **`MapsScreen`** sebagai halaman utama aplikasi yang akan menampilkan peta.

#### 2. **File `homepage.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
      ),
    );
  }
}
```

**Penjelasan:**
- **`MapsScreen`** adalah widget utama yang menampilkan peta Google.
  - Widget ini menggunakan **`StatefulWidget`** karena peta bisa mengalami perubahan dinamis, seperti zoom atau pergerakan peta.
  - **`_kMapCenter`** adalah koordinat pusat peta yang digunakan untuk menentukan lokasi awal yang ditampilkan di peta. Lokasi yang dipilih di sini adalah latitude 19.018255973653343 dan longitude 72.84793849278007.
  - **`CameraPosition`**: Ini menentukan pengaturan tampilan awal peta, seperti posisi awal dan tingkat zoom.
  
- **`GoogleMap`**: Ini adalah widget yang digunakan untuk menampilkan peta dari **Google Maps** menggunakan package `google_maps_flutter`. 
  - **`initialCameraPosition`**: Mengatur posisi dan tingkat zoom awal peta.
  - **`myLocationEnabled`**: Diaktifkan untuk menunjukkan lokasi pengguna di peta.

## Unguided
### Penjelasan Program Unguided
### Penjelasan Program Unguided

#### 1. **File `main.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:maps/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

**Penjelasan:**
- **`main.dart`**: Ini adalah titik awal dari aplikasi Flutter. Pada file ini, aplikasi dimulai dengan `runApp()` yang mengeksekusi widget `MyApp`.
- **`MaterialApp`**: Widget ini membungkus seluruh aplikasi dan menyediakan berbagai pengaturan dasar, seperti tema dan halaman utama.
  - **`colorScheme`** mengatur warna tema aplikasi menggunakan `Colors.deepPurple`.
  - **`home`** mengarahkan aplikasi untuk menampilkan widget **`MyHomePage`** sebagai halaman utama aplikasi, yang berfungsi untuk menampilkan peta.

#### 2. **File `homepage.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Lokasi awal: Köln, Jerman
  static final LatLng _kMapCenter = LatLng(50.9375, 6.9603);
  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);

  // API Key Google Maps (Ganti dengan API key Anda)
  final String apiKey = 'YOUR_GOOGLE_MAPS_API_KEY';

  // Marker
  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: const MarkerId("marker_koeln"),
        position: _kMapCenter,
        infoWindow: const InfoWindow(title: 'Köln', snippet: 'Germany'),
      ),
    };
  }

  // Place Picker
  void _showPlacePicker() async {
    LocationResult? result = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PlacePicker(
        apiKey: apiKey,
        onPlacePicked: (LocationResult result) {
          debugPrint("Place picked: ${result.formattedAddress}");
          Navigator.pop(context);
        },
        initialLocation: _kMapCenter,
        searchInputConfig: const SearchInputConfig(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
        searchInputDecorationConfig: const SearchInputDecorationConfig(
          hintText: "Search for places...",
        ),
      ),
    ));

    if (result != null) {
      debugPrint("Place picked: ${result.formattedAddress}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cologne Map'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 182, 255, 87),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showPlacePicker,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            myLocationEnabled: true,
            markers: _createMarker(),
          ),

          // Daftar Lokasi Terdekat
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: const Color.fromARGB(255, 5, 5, 5).withOpacity(0.7),
              height: 150,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  _buildNearbyPlaceItem("XII Apostel Hotel Albergo"),
                  _buildNearbyPlaceItem("CityClass Hotel Caprice am Dom"),
                  _buildNearbyPlaceItem("Hotel Stern am Rathaus"),
                  _buildNearbyPlaceItem("Gilden im Zims"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk item lokasi
  Widget _buildNearbyPlaceItem(String placeName) {
    return ListTile(
      title: Text(
        placeName,
        style: const TextStyle(color: Colors.white),
      ),
      leading: const Icon(Icons.place, color: Color.fromARGB(255, 2, 2, 2)),
      onTap: () {
        debugPrint("$placeName tapped");
      },
    );
  }
}
```

**Penjelasan:**

1. **`MyHomePage`** adalah widget utama yang digunakan untuk menampilkan peta dan lokasi terdekat, dengan fitur pencarian tempat.

   - **`_kMapCenter`**: Titik pusat peta yang akan ditampilkan pertama kali (lokasi di Köln, Jerman).
   - **`CameraPosition`**: Menentukan tampilan awal peta, dengan pengaturan posisi dan zoom.
   - **`apiKey`**: Menyimpan API key Google Maps yang diperlukan untuk mengakses layanan Google Maps dan Place Picker.

2. **`_createMarker()`**: Fungsi ini digunakan untuk menambahkan marker pada peta. Marker pertama ditambahkan di lokasi Köln dan menampilkan informasi tentang lokasi tersebut dengan menggunakan **`InfoWindow`**.

3. **`_showPlacePicker()`**: Fungsi ini menampilkan widget **PlacePicker**, yang memungkinkan pengguna untuk memilih lokasi atau tempat lain. Ketika pengguna memilih tempat, aplikasi akan mengembalikan alamat tempat tersebut dan menampilkannya pada log.

4. **`GoogleMap`**:
   - **`initialCameraPosition`**: Menentukan posisi awal dan zoom peta.
   - **`myLocationEnabled`**: Menampilkan lokasi pengguna di peta.
   - **`markers`**: Menampilkan marker pada peta yang dibuat sebelumnya.

5. **List Daftar Lokasi Terdekat**:
   - Di bagian bawah layar, terdapat sebuah daftar **ListView** yang berisi nama-nama tempat terdekat. Daftar ini ditampilkan dengan **ListTile**, dan setiap item dapat ditekan untuk melihat informasi lebih lanjut mengenai tempat tersebut.

6. **Widget `_buildNearbyPlaceItem`**: 
   - Fungsi ini digunakan untuk membuat item lokasi yang ditampilkan dalam daftar tempat terdekat. Setiap item berisi nama tempat dan ikon tempat.

## Hasil Output Unguided
![App Screenshot](/folder_img/ss_unguided1.jpg)
![App Screenshot](/folder_img/ss_unguided2.jpg)