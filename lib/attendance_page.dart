import 'package:flutter/material.dart';
import 'student.dart';

class AttendancePage extends StatefulWidget {
  final List<Student> students;

  AttendancePage({required this.students});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mark Attendance'),
        backgroundColor: Colors.black38,
      ),
      body: ListView.builder(
        itemCount: widget.students.length,
        itemBuilder: (context, index) {
          final student = widget.students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text(student.regNo),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Attendance: ${student.totalAttendance}'),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Mark attendance logic here
                    setState(() {
                      student.totalAttendance++;
                      student.totalClasses++;
                    });
                  },
                  child: Text('Mark'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
