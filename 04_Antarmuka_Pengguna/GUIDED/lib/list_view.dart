import 'package:flutter/material.dart';

class LatihanListView extends StatelessWidget {
  const LatihanListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuat variabel baru bernama listContainer
    List<Widget> listContainer = [
      Container(
        height: 200,
        width: 200,
        color: const Color.fromARGB(255, 218, 225, 230),
        child: Center(child: Text('Type A')),
      ),
      Container(
        height: 200,
        width: 200,
        color: const Color.fromARGB(255, 238, 166, 58),
        child: Center(child: Text('Type B')),
      ),
      Container(
        height: 200,
        width: 200,
        color: const Color.fromARGB(255, 151, 240, 100),
        child: Center(child: Text('Type C')),
      ),
      Container(
        height: 200,
        width: 200,
        color: const Color.fromARGB(157, 44, 240, 214),
        child: Center(child: Text('Type D')),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Lst View'),
        backgroundColor: const Color.fromARGB(255, 78, 200, 248),
      ),
      body: ListView.builder(
          itemCount: listContainer.length,
          itemBuilder: (context, index) {
            return listContainer[index];
          }),
      // body: ListView(
      //   scrollDirection: Axis.vertical,
      //   children: listContainer, // Menambahkan listContainer ke children
      // ),
    );
  }
}