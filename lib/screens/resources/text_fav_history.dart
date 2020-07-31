import 'package:flutter/material.dart';

class TextFavHistory extends StatefulWidget {
  final String text;
  final Icon icon;
  TextFavHistory(this.icon, this.text);


  @override
  TextFavHistoryState createState() => TextFavHistoryState();

}

class TextFavHistoryState extends State<TextFavHistory> {


  Widget build(BuildContext context) {
    return  Container(
        child:  Row(
          children: <Widget>[
            getLeftSection(widget.icon),
            getMiddleSection(widget.text),
          ],
        ),
      );

  }

}

Container getLeftSection(icon){
  return Container(
    padding: EdgeInsets.only(left: 50.0),
    child: icon,
  );
}

Container getMiddleSection(text){
  return Container(
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(text),
        ],
      )
  );
}