// screens/resources/resources.dart

import 'package:covid_resource_app_master/screens/resources/dropdown_resources.dart';
import 'package:covid_resource_app_master/screens/resources/text_fav_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';

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
  double bottomSheetSize = 250;
  double bottomSheetMinSize = 0;
  GoogleMap _map;





  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  List<DropdownMenuItem<DropdownResources>> _resourcesDropdownMenuItems;
  DropdownResources _selectedItem;
  Column _bottomSheetContent;
  ScrollController _scrollViewController;
  String _headerContent;
  bool _showAppbar = true;
  bool _showFAB = false;
  bool _showInitialHeader = true;
  LatLng _center;
  List<Marker> markers = <Marker>[];
  Set<Marker> _markers;

  void initState() {
    super.initState();
    _resourcesDropdownMenuItems = buildResourcesDropdownMenuItems();
    _bottomSheetContent = getInitialBottomSheetContent();
    _scrollViewController = ScrollController();
    _headerContent = 'How can we help?';
    _center =  LatLng(35.913460, -79.055470);
    _map = getMap();
    _markers = Set<Marker>.of(markers);
  }

  GoogleMap getMap(){
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 20.0,
      ),
      markers: _markers,
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
                  _bottomSheetContent = getUpdatedBottomSheetContent(value, context);
                  _headerContent = "Pull down to minimize";
                  _showInitialHeader = false;
                  _showAppbar = false;
                  _showFAB = true;
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


  Column getUpdatedBottomSheetContent(value, context) {
//    markers = <Marker>[];
    var listview = ListviewResourcesList(_selectedItem.collection, _scrollViewController, _mapController, _map);
    var updated_info = Column(
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
                  _bottomSheetContent = getUpdatedBottomSheetContent(value, context);
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
                child: listview,//Text(listview.markers.length.toString())//listview,
    )

          ),

        ]
    );

  setState(() {
    _markers = Set<Marker>.of(listview.markers);
  });


    return updated_info;
  }

  Column getBottomSheetContent(ScrollController scrollController) {
    return getInitialBottomSheetContent();
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
            height: 250,
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
        floatingActionButton: Visibility(
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
                        markers = <Marker>[];
                      });


                  }
              )
          ),
          visible: _showFAB,
        )

    );
  }
}

