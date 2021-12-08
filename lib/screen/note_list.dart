import 'dart:async';
import '../models/note.dart';
import '../utils/database_helper.dart';
// import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
// import '../screen/note_detail.dart';

class NoteList extends StatefulWidget {
  int count = 0;

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  late DatabaseHelper databaseHelper;
  late List<Note> noteList;
  List<Note> datas = [];
  bool fetching = true;
  int count = 0;
  static var _priority = ['Hight', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var _curentPriority = _priority[1];

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    getData2();
  }

  void getData2() async {
    datas = await databaseHelper.getData();
    setState(() {
      fetching = false;
    });
  }

  void dropDownItem(changeValue) {
    setState(() {
      _curentPriority = changeValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      // body: getNoteList(),
      //Beda Tutorial OI
      // body: FutureBuilder<List<Note>>(
      //     future: DatabaseHelper.instance.getNotes(),
      //     builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
      //       if (!snapshot.hasData) {
      //         return Center(child: Text('Loading'));
      //       }
      //       return snapshot.data!.isEmpty
      //           ? Center(child: Text('No Data in List'))
      //           : ListView(
      //               children: snapshot.data!.map((Note) {
      //                 return Center(
      //                   child: ListTile(
      //                     title: Text(Note.title),
      //                   ),
      //                 );
      //               }).toList(),
      //             );
      //     }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // navigateToDetail('Add Note');
          ShowMyDialog("Add Note");
        },
        tooltip: 'AddNote',
        child: Icon(Icons.add),
      ),
      body: fetching
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Text(datas[0].title),
            ),
    );
  }

  void ShowMyDialog(String titleBar) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 450,
              child: Scaffold(
                  appBar: AppBar(
                    title: Text(titleBar),
                  ),
                  body: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListView(
                      children: [
                        ListTile(
                          title: DropdownButton<String>(
                            items: _priority.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: _curentPriority,
                            onChanged: (changeValue) {
                              dropDownItem(changeValue);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextFormField(
                            controller: titleController,
                            onChanged: (value) {
                              debugPrint('changed In textField');
                            },
                            decoration: InputDecoration(
                              labelText: 'Title',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextFormField(
                            controller: descController,
                            onChanged: (value) {
                              debugPrint('changed In textField Description');
                            },
                            decoration: InputDecoration(
                              labelText: 'Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextFormField(
                            controller: dateController,
                            onChanged: (value) {
                              debugPrint('changed In textField Date');
                            },
                            decoration: InputDecoration(
                              labelText: 'Date',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: RaisedButton(
                                  color: Theme.of(context).primaryColorDark,
                                  textColor:
                                      Theme.of(context).primaryColorLight,
                                  child: Text(
                                    'Save',
                                    textScaleFactor: 1.5,
                                  ),
                                  onPressed: () {
                                    databaseHelper.insertData(Note(
                                        title: titleController.text,
                                        date: dateController.text,
                                        priority: _curentPriority,
                                        description: descController.text));
                                    moveToLastScreen();
                                    // navigateToList();
                                    // setState(() {
                                    //   debugPrint('Save Button Clicked');
                                    // });
                                  },
                                ),
                              ),
                              Container(
                                width: 5.0,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  color: Theme.of(context).primaryColorDark,
                                  textColor:
                                      Theme.of(context).primaryColorLight,
                                  child: Text(
                                    'Delete',
                                    textScaleFactor: 1.5,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      debugPrint('Delete Button Clicked');
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(printFileContent()),
                      ],
                    ),
                  )),
            ),
          );
        });
  }

  ListView getNoteList() {
    TextStyle? titleStyle = Theme.of(context).textTheme.headline6;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text('Dummy Title', style: titleStyle),
            subtitle: Text('dummy date'),
            trailing: Icon(Icons.delete, color: Colors.grey),
            onTap: () {
              ShowMyDialog("Edit Note");
            },
          ),
        );
      },
    );
  }

  // void navigateToDetail(String title) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return NoteDetail(title);
  //   }));
  // }

  void navigateToList() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteList();
    }));
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}


//GANTI

// class NoteDetail extends StatefulWidget {
//   String appBarTitle;
//   NoteDetail(this.appBarTitle);

//   @override
//   _NoteDetailState createState() => _NoteDetailState(this.appBarTitle);
// }

// class _NoteDetailState extends State<NoteDetail> {
//   late DatabaseHelper databaseHelper;
  

//   @override
//   void initState() {
//     super.initState();
//     databaseHelper = DatabaseHelper();
//     getData();
//   }

  
//   String appBarTitle;
//   _NoteDetailState(this.appBarTitle);

  
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }

  
// }