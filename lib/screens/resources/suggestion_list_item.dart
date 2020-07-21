import 'package:flutter/material.dart';

class SuggestionListItem extends StatefulWidget {
  final String text;
  final Icon icon;
  SuggestionListItem(this.icon, this.text);


  @override
  SuggestionListItemState createState() => SuggestionListItemState();

}

class SuggestionListItemState extends State<SuggestionListItem> {


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
    padding: EdgeInsets.only(left: 30.0),
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