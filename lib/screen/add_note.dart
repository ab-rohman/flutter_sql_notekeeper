import 'package:flutter/material.dart';

class addNote extends StatelessWidget {
  const addNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add data page"),
      ),
      body: Center(
        child: Text("Add Product"),
      ),
    );
  }
}
