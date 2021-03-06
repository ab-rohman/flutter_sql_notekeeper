import 'dart:async';
import 'package:flutter_sql_notekeeper/screen/note_list.dart';

import '../models/note.dart';
import '../utils/database_helper.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

// class NoteDetail extends StatefulWidget {
//   String appBarTitle;
//   NoteDetail(this.appBarTitle);

//   @override
//   _NoteDetailState createState() => _NoteDetailState(this.appBarTitle);
// }

// class _NoteDetailState extends State<NoteDetail> {
//   late DatabaseHelper databaseHelper;
//   List<Note> datas = [];
//   bool fetching = true;

//   @override
//   void initState() {
//     super.initState();
//     databaseHelper = DatabaseHelper();
//     getData();
//   }

//   void getData() async {
//     datas = await databaseHelper.getData();
//     setState(() {
//       fetching = false;
//     });
//   }

//   String appBarTitle;
//   _NoteDetailState(this.appBarTitle);
//   static var _priority = ['Hight', 'Low'];
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   //TextEditingController priorityController = TextEditingController();
//   var _curentPriority = _priority[1];

//   void dropDownItem(changeValue) {
//     setState(() {
//       _curentPriority = changeValue;
//     });
//   }

//   // printFileContent() async {
//   //   String FileContent = await downloadFile();
//   //   print('The content is ----> $FileContent');
//   // }

//   // Future<String> downloadFile() {
//   //   Future<String> result = Future.delayed(Duration(seconds: 0), () {
//   //     return 'my secret content';
//   //   });
//   //   return result;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(appBarTitle),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(10.0),
//           child: ListView(
//             children: [
//               ListTile(
//                 title: DropdownButton<String>(
//                   items: _priority.map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   value: _curentPriority,
//                   onChanged: (changeValue) {
//                     dropDownItem(changeValue);
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(5.0),
//                 child: TextFormField(
//                   controller: titleController,
//                   onChanged: (value) {
//                     debugPrint('changed In textField');
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Title',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(5.0),
//                 child: TextFormField(
//                   controller: descController,
//                   onChanged: (value) {
//                     debugPrint('changed In textField Description');
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Description',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(5.0),
//                 child: TextFormField(
//                   controller: dateController,
//                   onChanged: (value) {
//                     debugPrint('changed In textField Date');
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'Date',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: RaisedButton(
//                         color: Theme.of(context).primaryColorDark,
//                         textColor: Theme.of(context).primaryColorLight,
//                         child: Text(
//                           'Save',
//                           textScaleFactor: 1.5,
//                         ),
//                         onPressed: () {
//                           databaseHelper.insertData(Note(
//                               title: titleController.text,
//                               date: dateController.text,
//                               priority: _curentPriority,
//                               description: descController.text));
//                           moveToLastScreen();
//                           // navigateToList();
//                           // setState(() {
//                           //   debugPrint('Save Button Clicked');
//                           // });
//                         },
//                       ),
//                     ),
//                     Container(
//                       width: 5.0,
//                     ),
//                     Expanded(
//                       child: RaisedButton(
//                         color: Theme.of(context).primaryColorDark,
//                         textColor: Theme.of(context).primaryColorLight,
//                         child: Text(
//                           'Delete',
//                           textScaleFactor: 1.5,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             debugPrint('Delete Button Clicked');
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Text(printFileContent()),
//             ],
//           ),
//         ));
//   }

//   void navigateToList() {
//     Navigator.push(context, MaterialPageRoute(builder: (context) {
//       return NoteList();
//     }));
//   }

//   void moveToLastScreen() {
//     Navigator.pop(context);
//   }
// }
