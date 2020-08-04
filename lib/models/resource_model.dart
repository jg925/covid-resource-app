class Resource {
  static const String restaurants = 'Restaurants';
  static const String freeMeals = 'Free Meals';
  static const String preparedFamilyMeals = 'Prepared Family Meals';
  static const String specialtyFoodBev = 'Specialty Food & Beverage';

  String resourceName = '';
  String phoneNumber = '';
  String address = '';
  Map<String, bool> resourceTypes = {
    restaurants: false,
    freeMeals: false,
    preparedFamilyMeals: false,
    specialtyFoodBev: false
  };

  save() {
    print('saving resource data using web service');
  }
}