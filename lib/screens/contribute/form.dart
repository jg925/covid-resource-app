// screens/contribute/form.dart

import 'package:flutter/material.dart';


class CovidForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CovidFormState();
  }
}

class _CovidFormState extends State<CovidForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Resource Submission'),
      ),
      body: Container(
        child: Center(
          child: Text('Hello World!')
        ),
      ),
    );
  }
}
