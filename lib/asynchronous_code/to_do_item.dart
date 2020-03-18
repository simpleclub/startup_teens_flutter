import 'package:flutter/material.dart';
import 'detail_screen.dart';

class ToDoItem extends StatelessWidget {
  final String title;
  final bool done;
  final Function remove;
  final Function toggleDone;
  const ToDoItem(this.title, this.done, this.remove, this.toggleDone);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        leading: Checkbox(
          value: done,
          onChanged: (bool value) => toggleDone(),
          activeColor: Color.fromRGBO(23, 152, 185, 100),
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: done ? Color.fromRGBO(23, 152, 185, 100) : Colors.black54,
            decoration: done ? TextDecoration.lineThrough : TextDecoration.none,),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () => remove(),
        ),
        onTap: () => Navigator.push<dynamic>(context, MaterialPageRoute<dynamic>(builder: (BuildContext context) => DetailScreen(title, done))),
      ),
    );
  }
}