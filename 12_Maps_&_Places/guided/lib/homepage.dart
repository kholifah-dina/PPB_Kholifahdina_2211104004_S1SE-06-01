import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Posisi awal kamera
  static const LatLng _initialPosition =
      LatLng(19.018255973653343, 72.84793849278007);
  static const CameraPosition _kInitialCameraPosition = CameraPosition(
    target: _initialPosition,
    zoom: 11.0,
  );

  // Set marker
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId("marker_1"),
      position: LatLng(19.018255973653343, 72.84793849278007),
      infoWindow: InfoWindow(title: 'Marker 1', snippet: 'Mumbai Center'),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps HomePage'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialCameraPosition, // Posisi awal kamera
        myLocationEnabled: true, // Menampilkan lokasi pengguna
        zoomControlsEnabled: true, // Menampilkan kontrol zoom
        markers: _markers, // Menambahkan marker ke peta
      ),
    );
  }
}
