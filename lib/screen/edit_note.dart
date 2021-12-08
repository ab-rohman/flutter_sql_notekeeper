import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sql_notekeeper/screen/screen_api.dart';
import 'package:http/http.dart' as http;

class EditNote extends StatelessWidget {
  final Map note;
  EditNote({required this.note});
  TextEditingController _matkulController = TextEditingController();
  TextEditingController _kelasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future updateNote() async {
    final response = await http.put(
        Uri.parse("http://127.0.0.1:8000/api/notes/" + note['id'].toString()),
        body: {
          "matkul": _matkulController.text,
          "kelas": _kelasController.text,
        });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit data page"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _matkulController..text = note['matkul'],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "masukkan nama matkul";
                }
              },
              decoration: InputDecoration(labelText: "Matkul"),
            ),
            TextFormField(
              controller: _kelasController..text = note['kelas'],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "masukkan nama kelas";
                }
              },
              decoration: InputDecoration(labelText: "Kelas"),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    updateNote().then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeApi();
                      }));
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Note Edited")));
                    });
                  }
                },
                child: Text("UPDATE"))
          ],
        ),
      ),
    );
  }
}
