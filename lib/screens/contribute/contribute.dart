// screens/contribute/contribute.dart

import 'package:flutter/material.dart';
import 'section.dart';

class Contribute extends StatelessWidget {
  Contribute({this.color, this.title, this.onPush});
  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Ways You Can Help",
          ),
          backgroundColor: color,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Section("Add a Resource to this App","Description"),
              Section("Volunteer in Your Community","Description"),
              Section("Inspirations","One liner"),
            ]),
    );
  }

}
