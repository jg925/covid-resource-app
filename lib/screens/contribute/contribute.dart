// screens/contribute/contribute.dart

import 'package:covid_resource_app_master/screens/contribute/form.dart';
import 'package:covid_resource_app_master/style.dart';
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
            style: AppBarTextStyle
          ),
          backgroundColor: color,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Section(
                  "Add a Resource to this App",
                  "If you are a business owner and would like to help reach "+
                  "more customers during a time of need, feel free to sign up using "+
                  "the Getting Started button below.",
                  'assets/images/restaurant.png',
                  CovidForm()),
              Section(
                  "Volunteer in Your Community",
                  "Use the following link to explore opportunities to "+
                  "give back to your community during times of need. "+
                  "Your help is greatly appreciated.",
                  'assets/images/boston_garden.png',
                  null),
            ]),
    );
  }

}
