import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextSection extends StatelessWidget {
  final String _title;
  final String _body;
  static const _hPad = 16.0; //static bc const

  TextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Icon(Icons.bookmark),
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
            child: Text(_title, style: new TextStyle(fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, _hPad),
            child: Text(_body),
          ),
        ]
    );
  }
}