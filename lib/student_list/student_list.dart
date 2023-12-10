// student_list.dart
import 'dart:io';

import 'package:flutter/material.dart';

class Student {
  String name;
  int age;
  File? photo;

  Student({required this.name, required this.age, this.photo});
}

class StudentList extends StatelessWidget {
  final List<Student> students;

  StudentList({required this.students});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index].name),
            subtitle: Text('Age: ${students[index].age}'),
            leading: students[index].photo != null
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage: FileImage(students[index].photo!),
                  )
                : CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person),
                  ),
          );
        },
      ),
    );
  }
}
