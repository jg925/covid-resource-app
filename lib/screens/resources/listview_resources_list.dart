import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_resource_app_master/models/resource_details.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ListviewResourcesList extends StatefulWidget {
  final String category;
  final ScrollController scrollViewController;
  final GoogleMapController mapController;

  ListviewResourcesList(this.category, this.scrollViewController, this.mapController);

  @override
  ListviewResourcesListState createState() => ListviewResourcesListState();
}

class ListviewResourcesListState extends State<ListviewResourcesList> {

  Future<LatLng> getAddress(address) async {
    final query = address;
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var sample = addresses.first;
    var coords = LatLng(
        sample.coordinates.latitude, sample.coordinates.longitude);
    return coords;
  }

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
          onTap: () {
            getAddress(record.address).then((LatLng coords) {
              widget.mapController.moveCamera(CameraUpdate.newLatLng(coords));
            });
          },
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(widget.category).snapshots(),
      //widget.category//specialty_food_resources
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

}