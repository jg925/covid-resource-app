// screens/contribute/form.dart

import 'package:flutter/material.dart';
import '../../models/resource_model.dart';

class CovidForm extends StatefulWidget {
  @override
  _CovidFormState createState() => _CovidFormState();
}


class _CovidFormState extends State<CovidForm> {
  final _formKey = GlobalKey<FormState>();
  final _data = Resource();

  String _validateResourceName(String value) {
    //If empty, throw an error
    if (value.length <= 1) {
      return 'Please enter a valid resource name.';
    }
    return null;
  }

  String _validPhoneNumber(String value) {
    RegExp re = RegExp(r'[0-9]{3}-[0-9]{3}-[0-9]{4}');
    if (re.hasMatch(value)) {
      return null;
    }
    return "Phone number not valid.";
  }

  void submit() {
    // First validate form.
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save(); // Save our form now.
      _data.save();

      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Successful!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;

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
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number of Resource',
                  hintText: '000-000-0000',
                ),
                validator: this._validPhoneNumber,
                onSaved: (String value) {
                  this._data.phoneNumber = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Street Address'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an address.';
                  }
                  return null;
                },
                onSaved: (String value) {
                  this._data.address = value;
                }
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Text('Type of Resource'),
              ),
              CheckboxListTile(
                title: Text('Restaurant'),
                value:_data.resourceTypes[Resource.restaurants],
                onChanged: (value) {
                  setState(() => {
                    _data.resourceTypes[Resource.restaurants] = value,
                  });
                }
              ),
              CheckboxListTile(
                  title: Text('Free Meals'),
                  value:_data.resourceTypes[Resource.freeMeals],
                  onChanged: (value) {
                    setState(() => {
                      _data.resourceTypes[Resource.freeMeals] = value,
                    });
                  }
              ),
              CheckboxListTile(
                  title: Text('Prepared Family Meals'),
                  value:_data.resourceTypes[Resource.preparedFamilyMeals],
                  onChanged: (value) {
                    setState(() => {
                      _data.resourceTypes[Resource.preparedFamilyMeals] = value,
                    });
                  }
              ),
              CheckboxListTile(
                  title: Text('Specialty Food & Beverage'),
                  value:_data.resourceTypes[Resource.specialtyFoodBev],
                  onChanged: (value) {
                    setState(() => {
                      _data.resourceTypes[Resource.specialtyFoodBev] = value,
                    });
                  }
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
