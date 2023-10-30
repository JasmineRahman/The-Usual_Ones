import 'package:flutter/material.dart';
import 'StudentDashboard.dart';
class StudentLoginPage extends StatefulWidget {
  @override
  _StudentLoginPageState createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
  bool loginSuccessful = true;

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Login'),
        backgroundColor: Colors.white12,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add a back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.grey[900] ?? Colors.grey],

                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/logo.png', // Your logo image
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Add your login logic here, and if successful, navigate to AdminDashboard.
                            if (loginSuccessful) { // Replace with your actual login logic.
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => StudentDashboardPage()),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),

                        SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            // Add your signup navigation here
                          },
                          child: Text('Create an account',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}