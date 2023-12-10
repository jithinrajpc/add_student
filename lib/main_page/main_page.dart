// main_page.dart
import 'package:addstudent/student_add/student_add.dart';
import 'package:addstudent/student_list/student_list.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Student> students = [];
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Filtered list based on search input
    List<Student> filteredStudents = students
        .where((student) =>
            student.name.toLowerCase().contains(_searchController.text.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Students Page'),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {}); // Trigger a rebuild to reflect changes
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredStudents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredStudents[index].name),
                  subtitle: Text('Age: ${filteredStudents[index].age}'),
                  leading: CircleAvatar(
                    backgroundImage: filteredStudents[index].photo != null
                        ? FileImage(filteredStudents[index].photo!)
                        : AssetImage('assets/default_avatar.jpg') as ImageProvider,
                    radius: 25,
                  ),
                  // Add more details if needed
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddStudentPage()),
              );

              if (result != null && result is Student) {
                setState(() {
                  students.add(result);
                });
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            child: Text('Add Student', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
