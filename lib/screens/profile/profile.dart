import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({this.color, this.title, this.onPush});

  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile Page",
          ),
          backgroundColor: color,
        ),
        body: Container(
          color: Colors.white,
        ));
  }



}