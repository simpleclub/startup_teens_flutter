import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ToDo()));

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To-Do-App"),
          backgroundColor: Color.fromRGBO(35, 152, 185, 100),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      width: 50, height: 250, color: Colors.deepOrange[300]),
                  Container(
                      width: 100, height: 100, color: Colors.deepOrange[500]),
                  Container(
                      width: 60, height: 150, color: Colors.deepOrange[700]),
                  Container(
                      width: 20, height: 100, color: Colors.deepOrange[900]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('A'),
                  Text('B'),
                  Text('C'),
                  Text('D'),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Image.network(
                          'https://www.startupteens.de/web/media/videos/thumbs/ytThumbs/_H00KLyO-Vs_thumb.jpg')),
                  Expanded(
                      child: Image.network(
                          'https://www.startupteens.de/web/media/videos/thumbs/ytThumbs/gD4b0eheJXg_thumb.jpg'),
                      flex: 2),
                  Expanded(
                      child: Image.network(
                          'https://www.startupteens.de/web/media/videos/thumbs/ytThumbs/1_KKuw_lPlc_thumb.jpg')),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: Text(
                    'Tomate',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  trailing: Icon(Icons.delete_outline),
                ),
              )
            ],
          ),
        ));
  }
}
