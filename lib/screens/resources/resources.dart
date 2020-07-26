// screens/resources/resources.dart

import 'package:covid_resource_app_master/screens/resources/dropdown_resources.dart';
import 'package:covid_resource_app_master/screens/resources/text_fav_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../components/expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'listview_resources_list.dart';

class Resources extends StatefulWidget {
  Resources({this.color, this.title, this.onPush});

  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;

  ResourcesState createState() => ResourcesState();
}



class ResourcesState extends State<Resources> {
  GoogleMapController mapController;
  double bottomSheetSize = 250;
  double bottomSheetMinSize = 0;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<DropdownMenuItem<DropdownResources>> _resourcesDropdownMenuItems;
  DropdownResources _selectedItem;
  Column _bottomSheetContent;


  void initState() {
    super.initState();
    _resourcesDropdownMenuItems = buildResourcesDropdownMenuItems();
    _bottomSheetContent = getInitialBottomSheetContent();
  }

  Column getInitialBottomSheetContent() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 3,),
          DropdownButton<DropdownResources>(
              value: _selectedItem,
              items: _resourcesDropdownMenuItems,
              hint: Text("Select a category"),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                  bottomSheetSize = 500;
                  bottomSheetMinSize = 250;
                  _bottomSheetContent = getUpdatedBottomSheetContent(value);
                });
              }),
          Spacer(flex: 2,),
          TextFavHistory(Icon(Icons.star_border), "Choose a saved place"),
          Spacer(flex: 1,),
          Divider(indent: 70, endIndent: 70, thickness: 1,),
          Spacer(flex: 1,),
          TextFavHistory(Icon(Icons.history), "Choose from recents"),
          Spacer(flex: 3,),
        ]
    );
  }


  Column getUpdatedBottomSheetContent(value) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20,),
          DropdownButton<DropdownResources>(
              value: _selectedItem,
              items: _resourcesDropdownMenuItems,
              hint: Text("Select a category"),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                  _bottomSheetContent = getUpdatedBottomSheetContent(value);
                });
              }),
          SizedBox(height: 20,),
          Expanded(
              child: ListviewResourcesList(_selectedItem.value),
          ),

        ]
    );
  }

  //Firebase tutorial code start
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('restaurant_resources').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

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
          trailing: Text(record.address.toString()),
          ),
      ),
    );
  }




  //Firebase tutorial code end




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Resources",
          ),
          backgroundColor: widget.color,
        ),
        body: ExpandableBottomSheet(
          persistentContentHeight: bottomSheetMinSize,
          background: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          persistentHeader: Container(
            height: 40,
            color: Colors.grey,
            child: Center(
              child: Text('How can we help?'),
            ),
          ),
          expandableContent: Container(
            height: bottomSheetSize,
            color: Colors.white,
            child:  _buildBody(context)//_bottomSheetContent
          ),
       )
    );
  }
}

class Record {
  final String name;
  final String address;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['address'] != null),
        name = map['name'],
        address = map['address'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$address>";
}