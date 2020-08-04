import 'package:flutter/material.dart';
import 'package:covid_resource_app_master/assets/constants/constants.dart' as Constants;

class DropdownResources {
  final String collection;
  final String name;

  DropdownResources(this.collection, this.name);
}

List<DropdownResources> _resourcesDropdownItems = [
  DropdownResources(Constants.firebaseRestaurants, Constants.restaurants),
  DropdownResources(Constants.firebaseFreeMeals, Constants.freeMeals),
  DropdownResources(Constants.firebaseGroceries, Constants.groceries),
  DropdownResources(Constants.firebaseSpecialtyFoods, Constants.specialtyFoods)
];

List<DropdownMenuItem<DropdownResources>> buildResourcesDropdownMenuItems() {
  List<DropdownMenuItem<DropdownResources>> items = _resourcesDropdownItems.map((item){
      return DropdownMenuItem(
        child: Text(item.name),
        value: item,
      );
    }).toList();
  return items;
}