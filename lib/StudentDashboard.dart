import 'package:ex1/ViewMenuPage.dart';
import 'package:flutter/material.dart';
import 'SetMenuapp.dart';
class StudentDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
        backgroundColor: Colors.black38,
      ),
      body: Container(
        color: Colors.grey[200], // Page background color
        child: ListView(
          children: [
            DashboardCard(
              title: 'View Today\'s Menu',
              backgroundColor: Colors.grey, // Card background color
              icon: Icons.restaurant_menu, // Icon for today's menu
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewMenuPage()),
                );
                // Add logic to view today's menu
              },
            ),
            DashboardCard(
              title: 'View Attendance Percentage',
              backgroundColor: Colors.grey, // Card background color
              icon: Icons.check, // Icon for attendance percentage
              onTap: () {
                // Add logic to view attendance percentage
              },
            ),
            DashboardCard(
              title: 'View Admission Information',
              backgroundColor: Colors.grey, // Card background color
              icon: Icons.person, // Icon for admission information
              onTap: () {
                // Add logic to view admission information
              },
            ),
            DashboardCard(
              title: 'View Payment Details',
              backgroundColor: Colors.grey, // Card background color
              icon: Icons.payment, // Icon for payment details
              onTap: () {
                // Add logic to view payment details
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback? onTap;

  DashboardCard({
    required this.title,
    required this.backgroundColor,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      margin: EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.white,
              ),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, // Make the text bold
                  color: Colors.white, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
