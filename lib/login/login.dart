// login_page.dart
import 'package:addstudent/main_page/main_page.dart';
import 'package:addstudent/signup/signup.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PasssController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
             Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 130),
                child: Text(
                  "LogIn",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      
      
             Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller:_EmailController ,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    labelText: 'Email',
                    hintText: 'Enter your Email',
                    prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.green[9],
                    hintStyle: TextStyle(color: Colors.grey),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.transparent),
                    // ),
                  ),
                ),
              ),
      
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _PasssController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    labelText: 'Password',
                    hintText: 'Enter your Password',
                     prefixIcon: Icon(Icons.password_sharp),
                    filled: true,
                    fillColor: Colors.green[9],
                    hintStyle: TextStyle(color: Colors.grey),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.transparent),
                    // ),
                  ),
                ),
              ),
      
      
      
              
           Padding(
         padding: const EdgeInsets.only(top: 40),
         child: ElevatedButton(      
          onPressed: (){
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
             );
          },
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
          padding: const EdgeInsets.only(top: 120 , left: 70),
          child: Row(
            children:[
             Text("you don't have an account",
             style: TextStyle(
              color: Colors.grey
             ),),
             
            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
             );
              },
               child: Text("SignUp"),
               style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 20, 163, 32))
               ),
               ),
            ]
          ),
        )

          ]
        )
        

        

      )          
        
      
    );
  }
}
