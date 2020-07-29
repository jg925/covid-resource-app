import 'package:covid_resource_app_master/models/resource_details.dart';
import 'package:covid_resource_app_master/assets/constants/constants.dart' as Constants;

class ResourceItems {
  final String category;
  final List<ResourceDetails> details;

  ResourceItems(this.category, this.details);

  static List<ResourceItems> fetchAll() {
    return [
      ResourceItems(Constants.RESTAURANTS,
         []),
      ResourceItems(Constants.FREE_MEALS,
          []),
      ResourceItems(Constants.GROCERIES,
          []),
      ResourceItems(Constants.SPECIALTY_FOODS,[]),

    ];
  }
}