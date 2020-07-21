// screens/contribute/section.dart

import 'package:flutter/material.dart';
import 'description.dart';
import 'disp_image.dart';

class Section extends StatelessWidget {
  final String _title;
  final String _body;
  final String _assetPath;

  //static const double _hPad = 16.0;
  Section(this._title, this._body, this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Description(_title, _body),
          ),
          Container(
            child: DispImage(_assetPath),
          ),
        ],
      ),
    );
  }
}
