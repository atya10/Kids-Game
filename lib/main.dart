import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.indigo,
          appBar: AppBar(
            title: Text('تطابق صورة'),
            backgroundColor: Colors.indigo[800],
          ),
          body: ImagePage(),
        ),
      )
  );
}

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  var leftx  = 1;
  var rightx = 1;
  void changeImage () {
    leftx  = Random().nextInt(9) + 1;
    rightx = Random().nextInt(9) + 1;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftx == rightx
              ? 'مبروك لقد نجحت'
              : 'حاول مرة أخرى',
          style: TextStyle(
            fontSize: 42.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                   setState((){
                     changeImage ();
                   });
                  },
                  child: Image.asset('images/image-$leftx.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState((){
                      changeImage ();
                    });
                  },
                  child: Image.asset('images/image-$rightx.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}