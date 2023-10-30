import 'package:flutter/foundation.dart';
import 'student.dart';

class StudentProvider with ChangeNotifier {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
    notifyListeners();
  }
}
