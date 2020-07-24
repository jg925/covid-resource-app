import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  Profile({this.color, this.title, this.onPush});
  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent,Colors.indigoAccent],
              )
            ),
            child:Container(
              width:double.infinity,
              height:350.0,
              child:Center(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage("Katherine-Johnson.jpg"
                    ),
                    radius:50.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Katherine Johnson",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.blue
                      ),
                    ),
                  ],
                )
              )
            )
          )
        ],
        ),
    );
  }
}