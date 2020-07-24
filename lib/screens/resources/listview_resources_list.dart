import 'package:covid_resource_app_master/models/resource_list.dart';
import 'package:covid_resource_app_master/screens/resources/text_resource_item.dart';
import 'package:flutter/material.dart';

final List<String> entries = <String>[ 'C', 'A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C'];



class ListviewResourcesList extends StatefulWidget {
//  final String text;
//  final Icon icon;
  final int category;



  ListviewResourcesList(this.category);



  @override
  ListviewResourcesListState createState() => ListviewResourcesListState();

}

class ListviewResourcesListState extends State<ListviewResourcesList> {


  Widget build(BuildContext context) {
    final resourcesList = ResourceItems.fetchAll();
    final resource = resourcesList[widget.category];
    final list = textResourceItem(resource);


    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: list.length,//entries.length,
      itemBuilder: (BuildContext context, int index) {
        return list[index];
//        return Container(
//          height: 50,
//          child: Center(Text('Entry ${entries[index]}')),
//        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
//
//    return ListView.separated(
//      padding: const EdgeInsets.all(8),
//      itemCount: entries.length,
//      itemBuilder: (BuildContext context, int index) {
//        return Container(
//          height: 50,
//          child: Center(
//            child: Text("Entry ${entries[index]}")
//          ),
//        );
//      },
//      separatorBuilder: (BuildContext context, int index) => const Divider(),
//    );
  }

}


List<Widget> textResourceItem(ResourceItems resource) {
  return resource.details
      .map((details) => TextResourceItem(details.name, details.address))
      .toList();
}