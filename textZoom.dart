import 'package:flutter/material.dart';

class TextZoom extends StatefulWidget {
  TextZoom({Key? key}) : super(key: key);

  @override
  _TextZoomState createState() => _TextZoomState();
}

class _TextZoomState extends State<TextZoom> {
  double _textscaleFactor = 1.0;
  double _baseScaleFactor = 1.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onScaleStart: (details) {
          _baseScaleFactor = _textscaleFactor;
        },
        onScaleUpdate: (details) {
          setState(() {
            _textscaleFactor = _baseScaleFactor * details.scale;
          });
        },
        child: Scaffold(
          appBar: AppBar(title: Text("Scale text")),
          body: Center(
            child: Text(
              'بسم الله الرحمن الرحيم',
              textScaleFactor: _textscaleFactor,
            ),
          ),
        ));
  }
}
