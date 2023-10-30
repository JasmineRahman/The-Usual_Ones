import 'package:flutter/material.dart';
import 'menu_card.dart';
import 'menudata.dart';

class ViewMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> breakfastMenu = MenuData.menu['breakfast'] ?? [];
    List<String> lunchMenu = MenuData.menu['lunch'] ?? [];
    List<String> snacksMenu = MenuData.menu['snacks'] ?? [];
    List<String> dinnerMenu = MenuData.menu['dinner'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Today\'s Menu'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          MenuCard(title: 'Breakfast', menu: breakfastMenu),
          MenuCard(title: 'Lunch', menu: lunchMenu),
          MenuCard(title: 'Snacks', menu: snacksMenu),
          MenuCard(title: 'Dinner', menu: dinnerMenu),
        ],
      ),
    );
  }
}

