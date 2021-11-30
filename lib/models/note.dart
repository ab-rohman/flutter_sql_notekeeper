class Note {
  late int _id;
  late String _title;
  late String _date;
  late String _desc;
  late int _priority;

  Note(this._title, this._date, this._priority, this._desc);
  Note.withId(this._id, this._title, this._date, this._priority, this._desc);
  int get id => _id;
  String get title => _title;
  String get desc => _desc;
  int get priority => _priority;
  String get date => date;

  set title(String newTitle) {
    this._title = newTitle;
  }

  set desc(String newDesc) {
    this._desc = newDesc;
  }

  set priority(int newPriority) {
    this._priority = newPriority;
  }

  set date(String newDate) {
    this._date = newDate;
  }

  //convert a note object into map object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['desc'] = _desc;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  //Extract a note object into map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._desc = map['desc'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}
