import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_item_dialog.dart';
import 'database.dart';

void main() => runApp(MaterialApp(home: ToDo()));

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  FirebaseUser user;
  DatabaseService database;
  
  void addItem(String key) {
    database.setTodo(key, false);
    Navigator.pop(context);
  }

  void deleteItem(String key) {
    database.deleteTodo(key);
  }

  void toggleDone(String key, bool value) {
    database.setTodo(key, !value);
  }

  void newEntry() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AddItemDialog(addItem);
      }
    );
  }

  void connectToFirebase() async {
    final FirebaseAuth authenticate = FirebaseAuth.instance;
    AuthResult result = await authenticate.signInAnonymously();
    user = result.user;
    print(user.uid);
    database = DatabaseService(user.uid);

    if (!(await database.checkIfUserExists())) {
      database.setTodo('Todo anlegen', false);
    }
  }

  @override
  void initState() {
    super.initState();
    connectToFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do-App'),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
      body: Center(child: Text('Hier kommen Todos hin')),
      floatingActionButton: FloatingActionButton(
        onPressed: newEntry,
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
    );
  }
}
