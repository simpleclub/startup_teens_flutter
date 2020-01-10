// Startup Teens Flutter Tutorial #5

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ToDo()));

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To-Do-App'),
        ),
        body: Text('Hello Flutter'),
    );
  }
}