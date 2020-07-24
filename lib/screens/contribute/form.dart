// screens/contribute/form.dart

import 'package:flutter/material.dart';


class CovidForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CovidFormState();
  }
}

/*class _FormData {
  String username = '';
}*/

class _CovidFormState extends State<CovidForm> {
  //final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
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
