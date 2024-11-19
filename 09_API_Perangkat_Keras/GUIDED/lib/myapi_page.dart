import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Perbaikan import

class MyApiPage extends StatefulWidget {
  @override
  _MyApiPageState createState() => _MyApiPageState();
}

class _MyApiPageState extends State<MyApiPage> {
  File? _image; // Menyimpan gambar yang dipilih
  final ImagePicker _imagePicker = ImagePicker(); // ImagePicker instance

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: source,
        imageQuality: 50,
      );

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path); // Menyimpan gambar yang dipilih
        });
      }
    } catch (e) {
      print("Gagal mengambil gambar: $e");
    }
  }

  void _clearImage() {
    setState(() {
      _image = null; // Hapus gambar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My API Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image != null
              ? Image.file(
                  _image!,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                )
              : Container(
                  width: 300,
                  height: 300,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.image,
                    size: 100,
                    color: Colors.grey[600],
                  ),
                ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Text('Gallery'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Text('Camera'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _clearImage,
                child: Text('Hapus Gambar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
