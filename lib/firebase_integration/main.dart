import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';
import 'add_item_dialog.dart';
import 'to_do_item.dart';

void main() => runApp(MaterialApp(home: ToDo()));

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {

  // [DatabaseService] interacts with Firestore
  DatabaseService database;

  // Represents the user
  FirebaseUser user;

  void addItem(String item) {
    database.setUserTodo(item);
    Navigator.pop(context);
  }

  void deleteItem(String item) {
    database.deleteUserTodo(item);
  }

  void toggleDone(String item) {
    database.toggleTodoDone(item);
  }

  void newEntry() {
    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AddItemDialog(addItem);
        });
  }

  Future<Stream<DocumentSnapshot>> connectToFirebase() async {
    
    // The Firebase toolbox for authenication
    final FirebaseAuth auth = FirebaseAuth.instance;
    
    // Session is persist for this device, uid will stay the same
    AuthResult result = await auth.signInAnonymously(); 
    user = result.user;
    print('UserID: ' + user.uid);
    
    // get [DatabaseService] instance for current user
    database = DatabaseService(user.uid);
    
    // Check whether it's a new user
    await database.checkIfUserExists();

    // Get Stream with users todos
    return database.getDataStream();
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
          
          builder: (BuildContext context, AsyncSnapshot<Stream<DocumentSnapshot>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } 
            else {
              // When stream exists, use Streambilder to wait for data
              return StreamBuilder<DocumentSnapshot>(
                
                // Stream<DocumentSnapshot> with user todos
                stream: snapshot.data,

                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return new Text('Error: ${snapshot.error}');
                  }
                  else if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } 
                  else if (snapshot.data.data == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  else {
                    // resolve stream... Stream<DocumentSnapshot> -> DocumentSnapshot -> Map<String, bool>
                    Map<String, dynamic> items = snapshot.data.data;
                    print(items);
                    
                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          String key = items.keys.toList().reversed.elementAt(i);
                          return ToDoItem(
                            key,
                            items[key],
                            () => deleteItem(key),
                            () => toggleDone(key),
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
