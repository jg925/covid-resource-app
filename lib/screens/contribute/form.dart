// screens/contribute/form.dart

import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class CovidForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CovidFormState();
  }
}

class _FormData {
  String resourceName = '';
}

class _CovidFormState extends State<CovidForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _FormData _data = _FormData();

  String _validateResourceName(String value) {
    //If empty, throw an error
    if (value.length <= 1) {
      return 'Please enter a valid resource name.';
    }
    return null;
  }

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Successful!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Resource Submission'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: this._formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Name of Resource'),
                validator: this._validateResourceName,
                onSaved: (String value) {
                  this._data.resourceName = value;
                },
              ),
              Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text(
                    'Submit',
                    style: new TextStyle(color: Colors.white),
                  ),
                  onPressed: this.submit,
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
