import 'dart:collection';

class MenuData {
  static final Map<String, List<String>> menu = {};

  static void addMenu(String mealType, List<String> menuItems) {
    // Check the type of the `menuItems` variable.
    if (menuItems is List<String>) {
      // The `menuItems` variable is a `List<String>`, so we can safely add it to the `MenuData.menu` map.
      menu[mealType] = menuItems;
    } else {
      // The `menuItems` variable is not a `List<String>`, so we cannot add it to the `MenuData.menu` map.
      print('The `menuItems` variable is not a `List<String>`.');
    }
  }
}

