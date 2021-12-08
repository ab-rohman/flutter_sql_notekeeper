class Note {
  int? id;
  String title;
  String description;
  String date;
  String priority;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.priority,
  });

  factory Note.fromMap(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      priority: json['priority'],
    );
  }

  // set _desc(description) {}

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'priority': priority,
    };
  }
  // int get id => _id;
  // String get title => _title;
  // String get desc => _desc;
  // int get priority => _priority;
  // String get date => date;

  // set title(String newTitle) {
  //   this._title = newTitle;
  // }

  // set desc(String newDesc) {
  //   this._desc = newDesc;
  // }

  // set priority(int newPriority) {
  //   this._priority = newPriority;
  // }

  // set date(String newDate) {
  //   this._date = newDate;
  // }

  // //convert a note object into map object

  // Map<String, dynamic> toMap() {
  //   var map = Map<String, dynamic>();

  //   if (id != null) {
  //     map['id'] = _id;
  //   }
  //   map['title'] = _title;
  //   map['desc'] = _desc;
  //   map['priority'] = _priority;
  //   map['date'] = _date;

  //   return map;
  // }

  // //Extract a note object into map object
  // Note.fromMapObject(Map<String, dynamic> map) {
  //   this.id = map['id'];
  //   this.title = map['title'];
  //   this.description = map['desc'];
  //   this.priority = map['priority'];
  //   this.date = map['date'];
  // }
}
