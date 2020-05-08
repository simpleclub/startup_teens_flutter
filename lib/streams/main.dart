import 'package:flutter/material.dart';
import 'add_item_dialog.dart';
import 'to_do_item.dart';
import 'database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<void> connectToFirebase() async {

    // The Firebase toolbox for authenication
    final FirebaseAuth authenticate = FirebaseAuth.instance;

    // Session is persist for this device, uid will stay the same
    AuthResult result = await authenticate.signInAnonymously();
    
    user = result.user;

    // get [DatabaseService] instance for current user
    database = DatabaseService(user.uid);

    if (!(await database.checkIfUserExists())) {
      database.setTodo('Todo anlegen', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do-App'),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
      
      body: FutureBuilder(

          // Wait until [connectToFirebase] returns stream
          future: connectToFirebase(),

          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } 
            else {
              // When stream exists, use Streambilder to wait for data
              return StreamBuilder<DocumentSnapshot>(
                
                stream: database.getTodos(),

                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } 
                  else {
                    // resolve stream... Stream<DocumentSnapshot> -> DocumentSnapshot -> Map<String, bool>
                    Map<String, dynamic> items = snapshot.data.data;
                    
                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          String key = items.keys.elementAt(i);
                          return ToDoItem(
                            key,
                            items[key],
                            () => deleteItem(key),
                            () => toggleDone(key, items[key]),
                          );
                        });
                  }
                },
              );
            }
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: newEntry,
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
    );
  }
}
