## LAPORAN MODUL 12 MAPS & PLACES

## Guided
- File main.dart

import 'package:flutter/material.dart';
import 'package:maps/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MapsScreen(),
    );
  }
}

- File homepage.dart

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

## Hasil Output Guided
![App Screenshot](/folder_img/ss_guided.jpg)

## Unguided
- file main.dart

import 'package:flutter/material.dart';
import 'package:maps/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

- File homepage.dart

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

## Hasil Output Unguided
![App Screenshot](/folder_img/ss_unguided1.jpg)
![App Screenshot](/folder_img/ss_unguided2.jpg)
