// home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import 'add_note_page.dart';

class HomePage extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Notes',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 6,
        backgroundColor: Colors.brown.shade800,
        shadowColor: Colors.brown.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown.shade100, Colors.brown.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Obx(() {
          if (noteController.notes.isEmpty) {
            return Center(
              child: Text(
                'No Notes Available',
                style: TextStyle(
                  color: Colors.brown.shade600,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: noteController.notes.length,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemBuilder: (context, index) {
              final note = noteController.notes[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.shade300,
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  title: Text(
                    note['title'] ?? 'Untitled',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.brown.shade900,
                    ),
                  ),
                  subtitle: Text(
                    note['description'] ?? 'No Description',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.brown.shade700,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red.shade600),
                    onPressed: () {
                      noteController.removeNoteAt(index);
                    },
                  ),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNotePage());
        },
        backgroundColor: Colors.brown.shade700,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
