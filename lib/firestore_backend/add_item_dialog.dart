import 'package:flutter/material.dart';

class AddItemDialog extends StatefulWidget {

  final void Function(String txt) addItem;
  const AddItemDialog(this.addItem);

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {

  final GlobalKey<FormState> formKey = GlobalKey();
  String item;

  void save() {
    if (formKey.currentState.validate()) {
      widget.addItem(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              onChanged: (String txt) => item = txt,
              onFieldSubmitted: (String txt) => save(),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            SizedBox(height: 25),
            OutlineButton(
              onPressed: save,
              borderSide: BorderSide(width: 2, color: Color.fromRGBO(23, 152, 185, 100)),
              child: Text('Safe', style: TextStyle(color: Color.fromRGBO(23, 152, 185, 100)),),
            )
          ],
        )
      ),
    );
  }
}