import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatelessWidget {
  const FlexibleExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible & Expanded'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const Text('Flexible'),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 128, 86, 9),
              ),
              Flexible(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(255, 192, 153, 82),
                  child: const Text(
                      "This is flexible widget, it will take the remaining space "),
                ),
              ),
              Icon(Icons.sentiment_very_satisfied),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('Expanded'),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 100,
                color: const Color.fromARGB(255, 31, 105, 151),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(255, 91, 190, 217),
                  child: Text(
                      'This is Expanded Widget it force the widget to take up all remaining space'),
                ),
              ),
              Icon(Icons.sentiment_very_satisfied),
            ],
          )
        ],
      ),
    );
  }
}
