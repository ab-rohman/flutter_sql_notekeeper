import 'package:flutter/material.dart';

class NoteApiDetail extends StatelessWidget {
  final Map note;
  NoteApiDetail({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Detail"),
      ),
      body: Center(child: Text(note['matkul'])),
    );
  }
}
