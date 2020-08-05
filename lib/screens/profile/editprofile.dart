import 'package:covid_resource_app_master/app.dart';
import 'package:covid_resource_app_master/screens/profile/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'button.dart';
import 'profile.dart';


class EditProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    width: double.infinity;
    height: 300.0;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
          radius: 55.0,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT20qVa_TWylIuPI17x7iMU6zTa5Mq9IrcwqQ&usqp=CAU"
            ),
          )
      ),
        SizedBox(
        //height: 10.0,
      ),

         Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
            "   Katherine Johnson",
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.white
            ),
          ),
        ]
      ),
    ],
    ),
    );
  }
}
