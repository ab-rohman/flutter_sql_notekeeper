import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({Key? key}) : super(key: key);

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  static var _priority = ['Hight', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var _curentPriority = _priority[1];

  void dropDownItem(changeValue) {
    setState(() {
      _curentPriority = changeValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Note'),
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
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint('Save Button Clicked');
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
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
            ],
          ),
        ));
  }
}
