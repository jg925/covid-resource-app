import 'package:flutter/material.dart';
import 'package:covid_resource_app_master/assets/constants/constants.dart' as Constants;

class DropdownResources {
  String collection;
  String name;

  DropdownResources(this.collection, this.name);
}

List<DropdownResources> _resourcesDropdownItems = [
  DropdownResources(Constants.FIREBASE_RESTAURANTS, Constants.RESTAURANTS),
  DropdownResources(Constants.FIREBASE_FREE_MEALS, Constants.FREE_MEALS),
  DropdownResources(Constants.FIREBASE_GROCERIES, Constants.GROCERIES),
  DropdownResources(Constants.FIREBASE_SPECIALTY_FOODS, Constants.SPECIALTY_FOODS)
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