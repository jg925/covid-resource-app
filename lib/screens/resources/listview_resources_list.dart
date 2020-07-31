import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_resource_app_master/models/resource_details.dart';
import 'package:covid_resource_app_master/models/resource_list.dart';
import 'package:covid_resource_app_master/screens/resources/text_resource_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final List<String> entries = <String>[ 'C', 'A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C'];



class ListviewResourcesList extends StatefulWidget {
//  final String text;
//  final Icon icon;
  final String category;
  final ScrollController scrollViewController;



  ListviewResourcesList(this.category, this.scrollViewController);



  @override
  ListviewResourcesListState createState() => ListviewResourcesListState();

}

class ListviewResourcesListState extends State<ListviewResourcesList> {

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      controller: widget.scrollViewController,
      padding: const EdgeInsets.only(top: 10.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = ResourceDetails.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          subtitle: Text(record.address.toString()),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(widget.category).snapshots(),//widget.category//specialty_food_resources
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }


//  Widget build(BuildContext context) {
//    final resourcesList = ResourceItems.fetchAll();
//    final resource = resourcesList[widget.category];
//    final list = textResourceItem(resource);
//
//
//    return ListView.separated(
//      padding: const EdgeInsets.all(8),
//      itemCount: list.length,//entries.length,
//      itemBuilder: (BuildContext context, int index) {
//        return list[index];
////        return Container(
////          height: 50,
////          child: Center(Text('Entry ${entries[index]}')),
////        );
//      },
//      separatorBuilder: (BuildContext context, int index) => const Divider(),
//    );
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




List<Widget> textResourceItem(ResourceItems resource) {
  return resource.details
      .map((details) => TextResourceItem(details.name, details.address))
      .toList();
}