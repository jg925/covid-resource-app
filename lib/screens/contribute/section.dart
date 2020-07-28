// screens/contribute/section.dart

import 'package:flutter/material.dart';
import 'description.dart';
import 'disp_image.dart';

class Section extends StatelessWidget {
  final String _title;
  final String _body;
  final String _assetPath;
  final Object _link;

  //static const double _hPad = 16.0;
  Section(this._title, this._body, this._assetPath, this._link);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Description(_title, _body, _link),
          ),
          Container(
            child: DispImage(_assetPath),
          ),
        ],
      ),
    );
  }
}
