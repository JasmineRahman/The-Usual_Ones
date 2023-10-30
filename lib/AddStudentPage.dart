import 'package:flutter/material.dart';
import 'student.dart' ;
import 'package:provider/provider.dart';
import 'student_provider.dart';
class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController blockController = TextEditingController();
  final TextEditingController roomNoController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        backgroundColor: Colors.black38,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/b2.jpeg'), // Replace with your image path
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.white, // White background color
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Student Name',
                          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                          prefixIcon: Icon(Icons.person, color: Colors.black), // Icon for name
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: regNoController,
                        decoration: InputDecoration(
                          labelText: 'Reg No',
                          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                          prefixIcon: Icon(Icons.format_list_numbered, color: Colors.black), // Icon for regNo
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: mobileNumberController,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                          prefixIcon: Icon(Icons.phone, color: Colors.black), // Icon for mobileNumber
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: blockController,
                        decoration: InputDecoration(
                          labelText: 'Block',
                          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                          prefixIcon: Icon(Icons.apartment, color: Colors.black), // Icon for block
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: roomNoController,
                        decoration: InputDecoration(
                          labelText: 'Room No',
                          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                          prefixIcon: Icon(Icons.location_on, color: Colors.black), // Icon for roomNo
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final newStudent = Student(
                            name: nameController.text,
                            regNo: regNoController.text,
                            mobileNumber: mobileNumberController.text,
                            block: blockController.text,
                            roomNo: roomNoController.text,
                            totalAttendance: 0,
                            totalClasses: 0,
                          );
                          Provider.of<StudentProvider>(context, listen: false).addStudent(newStudent);
                          Navigator.pop(context, newStudent);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black), // Black background color
                        ),
                        child: Text('Add Student', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)), // Button text style
                      ),
                    ],
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
