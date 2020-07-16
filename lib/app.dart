// app.dart

import 'package:covid_resource_app_master/navigator_bar.dart';
import 'package:flutter/material.dart';
import 'navigator_bar.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigatorBar(),
    );
  }
}