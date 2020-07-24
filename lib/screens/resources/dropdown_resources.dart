import 'package:flutter/material.dart';

class DropdownResources {
  int value;
  String name;

  DropdownResources(this.value, this.name);
}

List<DropdownResources> _resourcesDropdownItems = [
  DropdownResources(0, "Restaurants"),
  DropdownResources(1, "Free meals"),
  DropdownResources(2, "Prepared family meals"),
  DropdownResources(3, "Specialty food & beverage")
];

List<DropdownMenuItem<DropdownResources>> buildResourcesDropdownMenuItems() {
  List<DropdownMenuItem<DropdownResources>> items = List();
  for (DropdownResources listItem in _resourcesDropdownItems) {
    items.add(
      DropdownMenuItem(
        child: Text(listItem.name),
        value: listItem,
      ),
    );
  }
  return items;
}