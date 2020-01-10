import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Widgets()));

class Widgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To-Do-App'),
          backgroundColor: Color.fromRGBO(35, 152, 185, 100)
        ),
        body: 
        Center( child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

//----------------------------- Some Basic Widgets: -------------------------------

              // This is how you create Text
              Text(
                'Hello Flutter',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Arial",
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
                ),
              ),

              // And this how to display Icons
              Icon(
                Icons.star,
                color: Colors.red,
                size: 100,
              ),

              // You want to display Pictures? You can use a network image:
              Image.network('https://www.startupteens.de/web/media/videos/thumbs/ytThumbs/rdna6SIcSdc_thumb.jpg'),

              // Or choose a local image, by creating an Asset in pubspec.yaml
              Image(
                image: AssetImage('images/src1.jpg'),
                width: 400,
                height: 200,
                fit: BoxFit.scaleDown,
              ),

//----------------------------------------------------------------------------

        ])));
  }
}
