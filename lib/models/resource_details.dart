class ResourceDetails {
  final String name;
  final String address;
  final String type;


  final bool curbside_pickup;
  final bool order_online;
  final bool delivery;

  ResourceDetails(this.name, this.address, {this.type = "",
    this.curbside_pickup=false, this.order_online=false, this.delivery=false});
}