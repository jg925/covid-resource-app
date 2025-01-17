import 'package:cloud_firestore/cloud_firestore.dart';

class ResourceDetails {
  final String name;
  final String address;
  final DocumentReference reference;

  ResourceDetails.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['address'] != null),
        assert(map['name'] != null),
        assert(map['address'] != null),
        assert(map['name'] != null),
        assert(map['address'] != null),
        name = map['name'],
        address = map['address'];

  ResourceDetails.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "ResourceDetails<$name:$address>";
}