// screens/contribute/contribute.dart

import 'package:flutter/material.dart';
import 'section.dart';

class Contribute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ways You Can Help'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextSection(Colors.red),
            TextSection(Colors.green),
            TextSection(Colors.blue),
          ]),
    );
  }
}
