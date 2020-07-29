// screens/contribute/description.dart

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Description extends StatelessWidget {
  final String _title;
  final String _body;
  final Widget _link;

  Description(this._title, this._body, this._link);

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
                  _link),
            );
          },
          child: Text('Getting Started \u2192'),
        ),
      ),
    ]);
  }
}
