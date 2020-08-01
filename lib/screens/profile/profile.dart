import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'text_section.dart';

class Profile extends StatelessWidget {
  Profile({this.color, this.title, this.onPush});

  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurpleAccent, Colors.indigoAccent],
              )
          ),
          child: Container(
              width: double.infinity,
              height: 250.0,
              child: Center(
                  child: Column(
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
                        height: 10.0,
                      ),

                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text(
                            "Katherine Johnson",
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white
                            ),
                          ),
                          IconButton(
                            icon:Icon(Icons.settings,

                            color: Colors.white,
                            size: 20.0,
                            )
                          ),

                        ]
                      ),
                    ],
                  )
              )
          ),
        ),
        Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextSection("Chef & the Farmer", "Address: 120 W Gordon St, Kinston, NC 28501"),
                TextSection("Whiskey Pig Craft Butchery", "214 N Herritage St, Kinston, NC 28501"),
                TextSection("Sugar Hill Pizzeria", "211 N Herritage St, Kinston, NC 28501"),
                TextSection("Mother Earth Brewing LLC", "311 N Herritage St, Kinston, NC 28501"),
              ],
            )
        )
    ]

    );
  }
}