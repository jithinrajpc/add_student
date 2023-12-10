import 'package:addstudent/login/login.dart';
import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}



class _SignupState extends State<Signup> {
  bool _checked=false;
  int _selectedValue = 1;
 final TextEditingController _nameController = TextEditingController();
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passController = TextEditingController();

 final TextEditingController _dateController = TextEditingController();
DateTime _selectedDate = DateTime.now();

Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: _selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (picked != null && picked != _selectedDate) {
    setState(() {
      _selectedDate = picked;
      _dateController.text = _selectedDate.toLocal().toString().split(' ')[0];
    });
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 60),
              child: Text(
                "SignUp",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter your name',
                   prefixIcon: Icon(Icons.man),
                  filled: true,
                  fillColor: Colors.green[9],
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                   prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.green[9],
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                   prefixIcon: Icon(Icons.password),
                  filled: true,
                  fillColor: Colors.green[9],
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 230, top: 10),
              child: Text(
                "Select Gender",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                Text("Male"),
                Radio(
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                Text("Female"),
                Radio(
                  value: 3,
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as int;
                    });
                  },
                ),
                Text("Others"),
              ],
            ),
            
          Padding(
  padding: EdgeInsets.all(10),
  child: TextField(
    controller: _dateController,
    
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Date Of Birth',
      hintText: 'Enter Date Of Birth ',
       prefixIcon: Icon(Icons.date_range),
      suffixIcon: IconButton(
        icon: const Icon(Icons.calendar_today),
        onPressed: () => _selectDate(context),
      ),
      filled: true,
      fillColor: Colors.green[9],
      hintStyle: TextStyle(color: Colors.grey),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    ),
    onTap: () => _selectDate(context), 
  ),
),

     CheckboxListTile(
          title: Text("I would like to receive your newsletter and other promotional information"),
          controlAffinity: ListTileControlAffinity.leading,
          value: _checked,
          onChanged: (value) {
           setState(() {
           _checked = value!;
            });
          },
   ),



     Padding(
       padding: const EdgeInsets.all(8.0),
       child: ElevatedButton(      
        onPressed: (){},
         child: Text("SUBMIT"),
         style: ButtonStyle(
           backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 20, 163, 32)),
         foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)), 
         padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 145, vertical: 20,)),
         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        ),
        ),
        ),
     ),    


     TextButton(
      onPressed: (){},
       child: Text("Forgot your password?"),
       style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 20, 163, 32))
       ),
       ),


        Padding(
          padding: const EdgeInsets.only(left: 95),
          child: Row(
            children:[ Text(
              "Already a member",
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
              
              TextButton(
                  onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  },
                   child: Text("Login"),
                   style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 20, 163, 32))
                   ),
                   ),
            ]
                     ),
        ),
          


         
          ],        
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Signup(),
  ));
}
