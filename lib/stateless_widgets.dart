import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ToDo()));

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To-Do-App"),
          backgroundColor: Color.fromRGBO(35, 152, 185, 100),
        ),
        body: Column(
          children: <Widget>[
            ToDoItem("Tomate"),
            ToDoItem("Käse"),
            ToDoItem("Lauch"),
            ToDoItem("Paprika"),
            ToDoItem("Wein"),
          ],
        ));
  }
}

class ToDoItem extends StatelessWidget {
  final String title;
  const ToDoItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        leading: Checkbox(
          value: false,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black54),
        ),
        trailing: Icon(Icons.delete_outline),
      ),
    );
  }
}
