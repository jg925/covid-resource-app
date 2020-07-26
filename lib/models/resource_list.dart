import 'package:covid_resource_app_master/models/resource_details.dart';

class ResourceItems {
  final String category;
  final List<ResourceDetails> details;

  ResourceItems(this.category, this.details);

  static List<ResourceItems> fetchAll() {
    return [
      ResourceItems("Restaurants",
         [ ResourceDetails(
             "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
           ResourceDetails(
               "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream")]),
      ResourceItems("Free Meals",
          [ResourceDetails(
              "IFC Community Kitchen", "100 W. Rosemary Street, Chapel Hill, NC 27516", type:"Community Kitchen")]),
      ResourceItems("Prepared family meals",
          [ ResourceDetails(
              "Big Belly Que", "306 W Franklin St, Suite G, Chapel Hill, NC 27516")]),
      ResourceItems("Specialty food & beverage",
          [ResourceDetails(
              "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream"),
            ResourceDetails(
                "Cold Stone Creamery", "131 E Franklin St, Chapel Hill, NC 27514", type:"Ice Cream")]),

    ];
  }
}