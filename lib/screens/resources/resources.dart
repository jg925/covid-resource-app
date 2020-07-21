// screens/resources/resources.dart

import 'package:covid_resource_app_master/screens/resources/resources_dropdown_options.dart';
import 'package:covid_resource_app_master/screens/resources/suggestion_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../components/expandable_bottom_sheet/expandable_bottom_sheet.dart';

class Resources extends StatefulWidget {
  Resources({this.color, this.title, this.onPush});

  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;

  ResourcesState createState() => ResourcesState();
}



class ResourcesState extends State<Resources> {
  GoogleMapController mapController;
  
  final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<DropdownMenuItem<ResourcesListItem>> _resourcesDropdownMenuItems;
  ResourcesListItem _selectedItem;
  

  void initState() {
    super.initState();
    _resourcesDropdownMenuItems = buildResourcesDropdownMenuItems();

  }



  int _value = 1;

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
            height: 250,
            color: Colors.white,
            child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(flex: 3,),
                    DropdownButton<ResourcesListItem>(
                        value: _selectedItem,
                        items: _resourcesDropdownMenuItems,
                        hint: Text("Select a category"),
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value;
                          });
                        }),
                    Spacer(flex: 2,),
                    SuggestionListItem(Icon(Icons.star_border), "Choose a saved place"),
                    Spacer(flex: 1,),
                    Divider(indent: 70, endIndent: 70, thickness: 1,),
                    Spacer(flex: 1,),
                    SuggestionListItem(Icon(Icons.history), "Choose from recents"),
                    Spacer(flex: 3,),
                  ]

            ),

          ),
       )
    );
  }
}
