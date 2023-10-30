import 'package:flutter/material.dart';
import 'student_login_page.dart'; // Import the Boys Hostel Login Page
import 'admin_login_page.dart'; // Import the Girls Hostel Login Page

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student / Admin'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[800]!,
              Colors.grey[900]!,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildHostelSelectionButton(context, 'assets/images/admin.png', 'Admin', AdminLoginPage()),
              SizedBox(height: 40),
              buildHostelSelectionButton(context, 'assets/images/student.jpeg', 'Student', StudentLoginPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHostelSelectionButton(BuildContext context, String imagePath, String buttonLabel, Widget pageToNavigate) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => pageToNavigate));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white38),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          SizedBox(width: 40),
          Text(buttonLabel),
        ],
      ),
    );
  }
}
