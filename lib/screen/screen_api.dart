import 'package:flutter/material.dart';
import 'package:flutter_sql_notekeeper/screen/add_note.dart';
import 'package:flutter_sql_notekeeper/screen/api_detail.dart';
import 'package:flutter_sql_notekeeper/screen/edit_note.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeApi extends StatefulWidget {
  const HomeApi({Key? key}) : super(key: key);

  @override
  State<HomeApi> createState() => _HomeApiState();
}

class _HomeApiState extends State<HomeApi> {
  final String url = 'http://127.0.0.1:8000/api/notes';

  Future getNote() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future deleteNote(String noteId) async {
    String url = 'http://127.0.0.1:8000/api/notes/' + noteId;
    var response = await http.delete(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Appbar'),
      ),
      body: FutureBuilder(
        future: getNote(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data['data'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Text(snapshot.data['data'][index]['matkul']),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NoteApiDetail(
                                note: snapshot.data['data'][index],
                              );
                            }));
                          },
                        ),
                        Spacer(),
                        Text(snapshot.data['data'][index]['kelas']),
                        Spacer(),
                        GestureDetector(
                          child: Icon(Icons.edit),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return EditNote(
                                note: snapshot.data['data'][index],
                              );
                            }));
                          },
                        ),
                        Spacer(),
                        GestureDetector(
                          child: Icon(Icons.delete),
                          onTap: () {
                            deleteNote(snapshot.data['data'][index]['id']
                                    .toString())
                                .then((value) {
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Note Deleted")));
                            });
                          },
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Text('Data Error');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return addNote();
          }));
        },
      ),
    );
  }
}
