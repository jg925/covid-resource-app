// screens/resources/resources.dart

import 'package:covid_resource_app_master/screens/resources/dropdown_resources.dart';
import 'package:covid_resource_app_master/screens/resources/text_fav_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();

  GoogleMapController _mapController;
  GoogleMap _map;
  ScrollController _scrollViewController;
  LatLng _center;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  List<DropdownMenuItem<DropdownResources>> _resourcesDropdownMenuItems;
  DropdownResources _selectedItem;


  Column _bottomSheetContent;
  String _headerContent;
  double bottomSheetSize = 250;
  double bottomSheetMinSize = 0;
  double _mapSize = 500;

  bool _showAppbar = true;
  bool _showFAB = false;
  bool _showInitialHeader = true;


  void initState() {
    super.initState();
    _center =  LatLng(35.913460, -79.055470);
    _map = getMap();
    _resourcesDropdownMenuItems = buildResourcesDropdownMenuItems();
    _bottomSheetContent = getInitialBottomSheetContent();
    _scrollViewController = ScrollController();
    _headerContent = 'How can we help?';
  }

  GoogleMap getMap(){
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 20.0,
      ),
      zoomGesturesEnabled: true,
    );
  }


  Column getInitialBottomSheetContent() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 2,),
          DropdownButton<DropdownResources>(
              value: _selectedItem,
              items: _resourcesDropdownMenuItems,
              hint: Text("Select a category"),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                  bottomSheetSize = 500;
                  bottomSheetMinSize = 300;
                  _bottomSheetContent = _getUpdatedBottomSheetContent(value, context);
                  _headerContent = "Pull down to minimize";
                  _showInitialHeader = false;
                  _showAppbar = false;
                  _showFAB = true;
                  _mapSize = 250;
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


  Column _getUpdatedBottomSheetContent(value, context) {
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
                  _bottomSheetContent = _getUpdatedBottomSheetContent(value, context);
                });
              }),
          Expanded(
              child: NotificationListener<ScrollUpdateNotification>(
                  onNotification: (ScrollNotification scrollInfo){
                    if (_scrollViewController.position.userScrollDirection ==
                        ScrollDirection.reverse) {
                      key.currentState.expand();
                    }
                    return true;
                  },
                child: ListviewResourcesList(_selectedItem.collection, _scrollViewController, _mapController),
             )
          ),
        ]
    );
  }

  Widget _getFAB(){
    return Visibility(
      child: Padding (
          padding: const EdgeInsets.only(top: 70.0),
          child: new FloatingActionButton(
              elevation: 0.0,
              child: new Icon(Icons.arrow_back),
              backgroundColor: new Color(0xFFE57373),
              onPressed: (){
                setState(() {
                  _selectedItem = null;
                  _showFAB = false;
                  _showAppbar = true;
                  bottomSheetSize = 250;
                  bottomSheetMinSize = 0;
                  _headerContent = 'How can we help?';
                  _showInitialHeader = true;
                  _bottomSheetContent = getInitialBottomSheetContent();
                  _mapSize = 500;
                });


              }
          )
      ),
      visible: _showFAB,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _showAppbar ? AppBar(
          title: Text(
            "Resources",
          ),
          backgroundColor: widget.color,
        )
            : PreferredSize(
          child: Container(),
          preferredSize: Size(30.0, 0.0),
        ),

        body: ExpandableBottomSheet(
          key: key,
          animationDurationExtend: Duration(milliseconds: 500),
          persistentContentHeight: bottomSheetMinSize,
          background: Container(
            height: _mapSize,
            alignment: Alignment.topCenter,
            child: _map,
          ),
          persistentHeader: Container(
            height: _showInitialHeader? 60 : 40,
            color: Colors.grey,
            child: Center(
              child: Text(_headerContent,
                style: TextStyle(color: Colors.black87, fontSize: _showInitialHeader ? 22: 16),),
            ),
          ),

          expandableContent: Container(
              height: bottomSheetSize,
              color: Colors.white,
              child:  _bottomSheetContent
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: _getFAB(),
    );
  }
}

