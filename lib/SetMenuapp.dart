import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'menu_card.dart';
import 'ViewMenuPage.dart';


import 'saveMenu.dart';

class MenuPage extends StatefulWidget {
  final bool isAdmin;

  const MenuPage({
    Key? key,
    required this.isAdmin,
  }) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Store the menu items for each meal
  final List<String> breakfastMenu = [];
  final List<String> lunchMenu = [];
  final List<String> snacksMenu = [];
  final List<String> dinnerMenu = [];

  // The new text field and button for the admin to set the menu
  final TextEditingController _menuController = TextEditingController();
  ElevatedButton? _saveButton;

  bool showMenu = false;

  @override
  void initState() {
    super.initState();

    if (widget.isAdmin) {
      // Create the save button for the admin
      _saveButton = ElevatedButton(
        onPressed: () {
          // Save the menu items to a database or other persistent storage
          saveMenu();
        },
        child: Text('Save Menu'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isAdmin) {
      return ViewMenuPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu for Today'),
        backgroundColor: Colors.black38,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Display the date at the top
                Text(
                  'Date: ${DateFormat('dd-MM-yyyy HH:mm').format(
                      DateTime.now())}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                // TextField for the admin to enter the menu items
                if (widget.isAdmin)
                  TextField(
                    controller: _menuController,
                    decoration: InputDecoration(
                      hintText: 'Enter the menu items',
                    ),
                  ),
                SizedBox(height: 16),
                // Button for the admin to save the menu
                if (widget.isAdmin) _saveButton!,
                SizedBox(height: 16),
                Visibility(
                  visible: showMenu,
                  child: Column(
                    children: [
                      // Card for breakfast
                      MenuCard(
                        title: 'Breakfast',
                        menu: breakfastMenu,
                        onMenuChanged: (value) {
                          setState(() {
                            breakfastMenu.add(value);
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      // Card for lunch
                      MenuCard(
                        title: 'Lunch',
                        menu: lunchMenu,
                        onMenuChanged: (value) {
                          setState(() {
                            lunchMenu.add(value);
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      // Card for snacks
                      MenuCard(
                        title: 'Snacks',
                        menu: snacksMenu,
                        onMenuChanged: (value) {
                          setState(() {
                            snacksMenu.add(value);
                          });
                        },
                      ),
                      SizedBox(height: 16),
                      // Card for dinner
                      MenuCard(
                        title: 'Dinner',
                        menu: dinnerMenu,
                        onMenuChanged: (value) {
                          setState(() {
                            dinnerMenu.add(value);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showMenu = !showMenu;
                    });
                  },
                  child: Text(showMenu ? 'Hide Menu' : 'View Menu'),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // The new logic to save the menu
  void saveMenu() async {
    // Get the menu items that the admin entered.
    final menuItems = _menuController.text.split('\n');

    // Create an instance of the SaveMenuLogic class.
    final saveMenuLogic = SaveMenuLogic();

    // Save the menu items to a database or JSON file.
    if (widget.isAdmin) {
      // Save the menu items to a database.
      await saveMenuLogic.saveMenuToDatabase(menuItems);
    } else {
      // Save the menu items to a JSON file.
      await saveMenuLogic.saveMenuToJsonFile(menuItems);
    }

    // Show a success message to the user.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Menu saved successfully!'),
    ));
  }

}