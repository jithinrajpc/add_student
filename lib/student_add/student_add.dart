import 'dart:io';

import 'package:addstudent/student_list/student_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late File _image;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _image = File('');
  }

  Future getImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Choose an option'),
                    content: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            getImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Text('Take a photo'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            getImage(ImageSource.gallery);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: Text('Choose from gallery'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Select Photo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Student student = Student(
                  name: _nameController.text,
                  age: int.tryParse(_ageController.text) ?? 0,
                  photo: _image,
                );
                Navigator.pop(context, student);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}
