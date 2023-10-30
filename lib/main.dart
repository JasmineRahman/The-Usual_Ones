import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student.dart';
import 'student_provider.dart';
import 'home.dart'; // Make sure you import your home page here

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentProvider()),
      ],
      child: MaterialApp( // Wrap your app with MaterialApp
        home: HomePage(), // Specify your home page here
      ),
    ),
  );
}
