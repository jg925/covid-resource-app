// screens/contribute/description.dart

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'form.dart';

class Description extends StatelessWidget {
  final String _title;
  final String _body;

  Description(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        child: Text(_title),
      ),
      Container(
        child: Text(_body),
      ),
      Container(
        child: FlatButton(
          color: Colors.white,
          textColor: Colors.blue,
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child:
                  CovidForm()),
            );
          },
          child: Text('Getting Started \u2192'),
        ),
      ),
    ]);
  }
}
