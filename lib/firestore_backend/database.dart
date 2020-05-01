import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String userID;
  DatabaseService(this.userID);

  final CollectionReference userTodos = Firestore.instance.collection('userTodos');
  
   Future setTodo(String key, bool value) async {
    return await userTodos.document(userID).setData(
      {key: value}, merge: true);
  }

  Future deleteTodo(String key) async {
    return await userTodos.document(userID).updateData({
      key: FieldValue.delete(),
    });
  }

  Future checkIfUserExists() async {
    if ((await userTodos.document(userID).get()).exists) {
      return true;
    } else {
      return false;
    }
  }
}