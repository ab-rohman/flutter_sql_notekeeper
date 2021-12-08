import 'package:flutter/material.dart';
import 'package:flutter_sql_notekeeper/screen/edit_note.dart';

class NoteApiDetail extends StatelessWidget {
  final Map note;
  NoteApiDetail({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Detail"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(note['matkul']),
          Spacer()
        ],
      )),
    );
  }
}
