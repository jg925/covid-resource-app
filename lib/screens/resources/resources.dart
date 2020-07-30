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
  ScrollController _scrollViewController;
  String _headerContent;
  bool _showAppbar = true;
  bool _showFAB = false;
  bool _showInitialHeader = true;


  void initState() {
    super.initState();
    _resourcesDropdownMenuItems = buildResourcesDropdownMenuItems();
    _bottomSheetContent = getInitialBottomSheetContent();
    _scrollViewController = ScrollController();
    _headerContent = 'How can we help?';

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
                child: ListviewResourcesList(_selectedItem.collection, _scrollViewController),
    )

          ),



        ]
    );
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
          background: Column (
            children: <Widget>[
              Expanded(
                child:  GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              )

            ],

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

                      });
                  }
              )
          ),
          visible: _showFAB,
        )

    );
  }
}

