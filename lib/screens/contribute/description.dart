// screens/contribute/description.dart

import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String _title;
  final String _body;

  Description(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            //padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
            child: Text(_title),
          ),
          Container(
            //padding: const EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, _hPad),
            child: Text(_body),
          ),
        ]
    );
  }
}
/*mainAxisAlignment: MainAxisAlignment.spaceAround,
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Container(
//padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
child: Text(_title),
),
Container(
//padding: const EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, _hPad),
child: Text(_body),
),
]),*/
