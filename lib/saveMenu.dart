import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class SaveMenuLogic {
  // A function to save the menu items to a database.
  Future<void> saveMenuToDatabase(List<String> menuItems) async {
    // Get the database connection.
    Database database = await openDatabase('menu_database.db');

    // Create a table to store the menu items, if it does not already exist.
    await database.execute('CREATE TABLE IF NOT EXISTS menu (id INTEGER PRIMARY KEY AUTOINCREMENT, item TEXT)');

    // Insert the menu items into the database.
    for (String item in menuItems) {
      await database.insert('menu', {
        'item': item,
      });
    }

    // Close the database connection.
    await database.close();
  }

  // A function to save the menu items to a JSON file.
  File? jsonFile;

  // A function to save the menu items to a JSON file.
  Future<void> saveMenuToJsonFile(List<String> menuItems) async {
    // If the JSON file is null, create it.
    if (jsonFile == null) {
      jsonFile = File('menu.json');
    }

    // Write the menu items to the JSON file.
    await jsonFile!.writeAsString(jsonEncode(menuItems));
  }
}
