import 'package:flutter/material.dart';

class ResourcesListItem {
  int value;
  String name;

  ResourcesListItem(this.value, this.name);
}

List<ResourcesListItem> _resourcesDropdownItems = [
  ResourcesListItem(1, "Restaurants"),
  ResourcesListItem(2, "Free meals"),
  ResourcesListItem(3, "Prepared family meals"),
  ResourcesListItem(4, "Specialty food & beverage")
];

List<DropdownMenuItem<ResourcesListItem>> buildResourcesDropdownMenuItems() {
  List<DropdownMenuItem<ResourcesListItem>> items = List();
  for (ResourcesListItem listItem in _resourcesDropdownItems) {
    items.add(
      DropdownMenuItem(
        child: Text(listItem.name),
        value: listItem,
      ),
    );
  }
  return items;
}