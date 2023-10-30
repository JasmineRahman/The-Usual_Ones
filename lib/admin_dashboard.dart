import 'package:ex1/student.dart';
import 'announcement.dart';
import 'StudentDetailsPage.dart';
import 'package:flutter/material.dart';
import 'SetMenuapp.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'attendance_page.dart';
import 'student_provider.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String currentAnnouncement = '';
  bool showAnnouncement = false;

  void sendAnnouncement(String message, List<PlatformFile>? attachments) {
    setState(() {
      currentAnnouncement = message;
      showAnnouncement = true;
    });

    // Hide the announcement after 10 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        showAnnouncement = false;
      });
    });
  }
  List<Student> students = [];

  void addStudent(Student student) {
    setState(() {
      students.add(student);
    });
  }


  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<StudentProvider>(context);
    List<Student> students = studentData.students;
    //List<Student> attendanceList = studentData.attendanceList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.white12,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/b2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Colors.white38,
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 36,
                    ),
                    title: Text(
                      'Student Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'View and manage student information',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentDetailsPage(),
                        ),
                      );
                    },
                  ),
                ),

                Card(
                  color: Colors.white60,
                  child: ListTile(
                    leading: Icon(
                      Icons.people_alt_outlined,
                      color: Colors.white,
                      size: 36,
                    ),
                    title: Text(
                      'Attendance',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text('Manage student attendance records'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttendancePage(students:students),
                        ),
                      );
                    },
                  ),
                ),

                // Card for Set Menu
                Card(
                  color: Colors.white24,
                  child: ListTile(
                    leading: Icon(
                      Icons.food_bank_outlined,
                      color: Colors.white,
                      size: 36,
                    ),
                    title: Text(
                      'Set Menu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text('Customize hostel menu settings'),
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuPage(isAdmin: true),
                          ),
                        );
                      // Add logic to navigate to the set menu page
                    },
                  ),
                ),

                // Card for Announcements
                Card(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Icon(
                      Icons.announcement_outlined,
                      color: Colors.white,
                      size: 36,
                    ),
                    title: Text(
                      'Announcements',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text('Publish and manage announcements'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnnouncementPage(
                            sendAnnouncementCallback: sendAnnouncement,
                            updateAnnouncementMessage: (message) {
                              setState(() {
                                currentAnnouncement = message;
                                showAnnouncement = true;
                              });
                              Future.delayed(Duration(seconds: 10), () {
                                setState(() {
                                  showAnnouncement = false;
                                });
                              });
                            },
                          ),
                        ),
                      );


                      // Add logic to navigate to the announcements page
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
