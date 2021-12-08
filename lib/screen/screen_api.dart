import 'package:flutter/material.dart';
import 'package:flutter_sql_notekeeper/screen/add_note.dart';
import 'package:flutter_sql_notekeeper/screen/api_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeApi extends StatelessWidget {
  const HomeApi({Key? key}) : super(key: key);
  final String url = 'http://127.0.0.1:8000/api/notes';
  //final String url = 'http://10.0.2.2/api/notes';

  Future getNote() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NoteApiDetail(
                          note: snapshot.data['data'][index],
                        );
                      }));
                    },
                    child: Row(
                      children: [
                        Text(snapshot.data['data'][index]['matkul']),
                        Text(snapshot.data['data'][index]['kelas']),
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
