import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan7',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AppTypesScreen(),
    );
  }
}

class AppTypesScreen extends StatelessWidget {
  void showDetailsDialog(
      BuildContext context, String appType, List<String> platforms) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                appType,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 8),
              Text(platforms.join(', ')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Types'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.red),
            title: Text('Native App', style: TextStyle(fontSize: 18)),
            onTap: () {
              showDetailsDialog(context, 'Native App', ['Android', 'iOS']);
            },
          ),
          SizedBox(height: 16),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.grey),
            title: Text('Hybrid App', style: TextStyle(fontSize: 18)),
            onTap: () {
              showDetailsDialog(context, 'Hybrid App',
                  ['Android', 'iOS', 'Web', 'Javascript', 'Dart']);
            },
          ),
        ],
      ),
    );
  }
}
