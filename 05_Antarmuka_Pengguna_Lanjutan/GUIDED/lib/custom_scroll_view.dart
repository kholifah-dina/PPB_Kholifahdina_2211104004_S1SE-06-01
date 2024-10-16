import 'package:flutter/material.dart';

class CustomScrollViewScreen extends StatelessWidget {
  const CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver'),
        backgroundColor: Colors.amber,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            backgroundColor: Colors.redAccent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Sliver App Bar',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),

          //   Sliver Grid
          SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.black38,
                  child: Text('Grid Item $index'),
                );
              }, childCount: 20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4)),

          // Sliver Fixed List
          SliverFixedExtentList(
            itemExtent: 20.0,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 197, 147, 41),
                child: Text('List Item $index'),
              );
            }),
          ),
        ],
      ),
    );
  }
}
