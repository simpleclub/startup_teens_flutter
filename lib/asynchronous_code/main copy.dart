import 'package:flutter/material.dart';
import 'add_item_dialog.dart';
import 'to_do_item.dart'; 

void main() => runApp(MaterialApp(home: ToDo()));

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  Map<String, bool> products = {};

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

  void loadData() {
    
    Future.delayed(Duration(seconds: 0), () {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text("Loading"),
                ),
              ],
            ),
          ),
      ));
    }
    );

    Future.delayed(Duration(seconds: 2), () {
      print('Connect to database...');
    });

    Future.delayed(Duration(seconds: 3), () {
      print('Load data 1');
    });

    Future.delayed(Duration(seconds: 4), () {
      print('Load data 2');
    });

    Future.delayed(Duration(seconds: 0), () {
      setState(() {
          products = {'Flutter lernen': false, 'App programmieren': false, 'Reich werden': false, 'Alkohol kaufen': false, 'Spaß haben': false};
      });
      Navigator.of(context).pop();
    });
    
  }

  @override
  void initState() {
    super.initState();
    loadData();
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