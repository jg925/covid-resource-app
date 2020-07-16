// navigator_bar.dart

import 'package:flutter/material.dart';
import 'screens/contribute/contribute.dart';
import 'screens/help/help.dart';
import 'screens/resources/resources.dart';

class NavigatorBar extends StatefulWidget {
  NavigatorBar({Key key}) : super(key: key);

  @override
  NavigatorBarState createState() => NavigatorBarState();
}

class NavigatorBarState extends State<NavigatorBar> {
  int selectedIndex = 0;
  final widgetOptions = [
    Text('Resources'),
    Contribute(),
    Text('Help'),
    //Help(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text('Home'),
      //),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), title: Text('Resources')),
          BottomNavigationBarItem(icon: Icon(Icons.event_note), title: Text('Contribute')),
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Help Chat')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
}