import 'package:flutter/material.dart';
import 'add_item_dialog.dart';
import 'to_do_item.dart'; 

void main() => runApp(MaterialApp(home: ToDo()));

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  Map<String, bool> products = {'Flutter lernen': false, 'App schreiben': false, 'Reich werden': false, 'Alkohol kaufen': false ,'Spaß haben': false};

  void addItem(String item) {
    setState(() {
      products[item] = false;
    });
    Navigator.pop(context);
  }

  void deleteItem(String key) {
    setState(() {
      products.remove(key);
    });
  }

  void toggleDone(String key) {
    setState(() {
      products.update(key, (bool done) => !done);
    });
  }

  void newEntry() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AddItemDialog(addItem);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To-Do-App'),
          backgroundColor: Color.fromRGBO(35, 152, 185, 100),
        ),
        body:
          ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) {
              String key = products.keys.elementAt(i);
              return ToDoItem(
                key,
                products[key],
                () => deleteItem(key),
                () => toggleDone(key),
              );
            },
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: newEntry,
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(35, 152, 185, 100),
        ),
    );
  }

}