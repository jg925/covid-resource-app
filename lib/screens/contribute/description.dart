// screens/contribute/description.dart

import 'package:covid_resource_app_master/style.dart';
import 'package:flutter/material.dart';
import 'links.dart';

class Description extends StatelessWidget {
  final String _title;
  final String _body;
  final Widget _link;

  Description(this._title, this._body, this._link);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Container(
        child: Text(_title, style: TitleTextStyle),
      ),
      Container(
        child: Text(_body, style: DescriptionTextStyle),
      ),
      Container(
        child: FlatButton(
          color: Colors.white,
          textColor: Colors.blue,
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            if (_link != null) CovidFormLink(context, _link);
          },
          child: Text('Getting Started \u2192'),
        ),
      ),
    ]);
  }
}
