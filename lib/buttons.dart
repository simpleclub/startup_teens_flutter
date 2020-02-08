import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    void inform() {
      showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Thanks!"),
          );
        }
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Buttons')),
      body: Center(
        child: Text("Press the Button!"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: inform,
          child: Icon(Icons.arrow_downward),
        ),
    );
  }
}