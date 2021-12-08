import 'package:flutter/material.dart';
//import 'package:flutter_sql_notekeeper/screen/note_detail.dart';
//import 'package:flutter_sql_notekeeper/screen/note_list.dart';
import 'package:flutter_sql_notekeeper/screen/screen_api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteKeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeApi(),
    );
  }
}
