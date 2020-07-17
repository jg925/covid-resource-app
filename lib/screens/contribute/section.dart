// screens/contribute/section.dart

import 'package:flutter/material.dart';
import 'description.dart';

class Section extends StatelessWidget {
  final String _title;
  final String _body;

  //static const double _hPad = 16.0;
  Section(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Description(_title, _body),
          ),
          Container(
            child: Text("Hi"), //Image.asset("assets/images/restaurant.jpg"),
          ),
        ],
      ),
    );
  }
}
