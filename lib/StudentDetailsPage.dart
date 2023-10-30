import 'student.dart' ;
import 'student_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'AddStudentPage.dart';
import 'package:provider/provider.dart';



class StudentDetailsPage extends StatefulWidget {
  @override
  _StudentDetailsPageState createState() => _StudentDetailsPageState();
}
class _StudentDetailsPageState extends State<StudentDetailsPage> {
  List<Student> students = [];
  List<Student> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    filteredStudents = students;
  }

  void filterStudents(String query) {
    setState(() {
      filteredStudents = students
          .where((student) =>
      student.name.toLowerCase().contains(query.toLowerCase()) ||
          student.regNo.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
        backgroundColor: Colors.white10,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
              final query = await showSearch(
                context: context,
                delegate: StudentSearchDelegate(filterStudents),
              );
              if (query != null) {
                filterStudents(query);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Student Name')),
            DataColumn(label: Text('Reg No')),
            DataColumn(label: Text('Block')),
            DataColumn(label: Text('Room No')),
            DataColumn(label: Text('Actions')),
          ],
          rows: filteredStudents
              .asMap()
              .entries
              .map(
                (studentEntry) => DataRow(
              cells: [
                DataCell(Text(studentEntry.value.name)),
                DataCell(Text(studentEntry.value.regNo)),
                DataCell(Text(studentEntry.value.block)),
                DataCell(Text(studentEntry.value.roomNo)),
                DataCell(
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, studentEntry.value,);
                    },
                  ),
                ),
              ],
            ),
          )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newStudent = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStudentPage(),
            ),
          );

          if (newStudent != null) {
            setState(() {
              students.add(newStudent);
              filterStudents(""); // Reset the search filter
            });
          }
        },
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.grey,
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Student student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Student'),
          content: Text('Are you sure you want to delete ${student.name}?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Provider.of<StudentProvider>(context, listen: false).students.remove(student);
                Provider.of<StudentProvider>(context, listen: false).notifyListeners();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


class StudentSearchDelegate extends SearchDelegate {
  final Function(String) onSearch;

  StudentSearchDelegate(this.onSearch);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearch(query);
    return Container(); // Adjust as needed
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // Implement suggestions as needed
  }
}
