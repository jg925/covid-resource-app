import 'package:covid_resource_app_master/models/resource_details.dart';
import 'package:covid_resource_app_master/assets/constants/constants.dart' as Constants;

class ResourceItems {
  final String category;
  final List<ResourceDetails> details;

  ResourceItems(this.category, this.details);

  static List<ResourceItems> fetchAll() {
    return [
      ResourceItems(Constants.restaurants,
         []),
      ResourceItems(Constants.freeMeals,
          []),
      ResourceItems(Constants.groceries,
          []),
      ResourceItems(Constants.specialtyFoods,[]),

    ];
  }
}