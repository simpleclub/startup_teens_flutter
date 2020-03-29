import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  // userID of User is used as document name
  final String userID;
  DatabaseService(this.userID);

  // firestoreData refers to collection todos, where all documents get stored
  final CollectionReference firestoreData = Firestore.instance.collection('todos');

  // if document with name userID exists, return true, otherwise create one
  Future checkIfUserExists() async {
    if ((await firestoreData.document(userID).get()).exists) {
      return true;
    } else {
      await firestoreData.document(userID).setData({
        'To Do anlegen': false,
      });
      return false;
    }
  }

  // return stream with user todos
  Stream<DocumentSnapshot> getDataStream() {
    return firestoreData.document(userID).snapshots();
  }

  // store new item, if item already exists, value gets set to false
  Future setUserTodo(String item) async {
    return await firestoreData.document(userID).updateData({
      item: false,
    });
  }

  // delete item 
  Future deleteUserTodo(String item) async {
    return await firestoreData.document(userID).updateData({
      item: FieldValue.delete(),
    });
  }

  // set value of item to !value
  void toggleTodoDone(String item) async {
    firestoreData.document(userID).get().then( (snapshot) {
      firestoreData.document(userID).updateData({
        item: !snapshot.data[item],
      });
    });
  }
}