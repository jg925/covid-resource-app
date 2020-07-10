// screens/Resources/Resources.dart

import 'package:flutter/material.dart';

class Resources extends StatefulWidget {
  Resources({Key key}) : super(key: key);

  @override
  ResourcesState createState() => ResourcesState();
}

class ResourcesState extends State<Resources> {
  int selectedIndex = 0;
  final widgetOptions = [
    Text('Resources'),
    Text('Contribute'),
    Text('Help Chat'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid Resources'),
        ),
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