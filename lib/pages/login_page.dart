import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login.png",
          fit: BoxFit.cover,
           ),
           SizedBox(
             height: 10,
           ),
           Text("Welcome",
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold
           ),
           ),
           SizedBox(
             height: 10,
           ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
             child: Column(
               children: [
                  TextFormField(
               decoration: InputDecoration(
                 hintText: "Enter Your Username",
                 labelText: "Username"
               ),
             ),
             SizedBox(
               height: 10,
             ),
             TextFormField(
               obscureText: true,
               decoration: InputDecoration(
                 hintText: "Enter Your Password",
                 labelText: "Password"
               ),
             ),
             SizedBox(
               height: 20,
             ),
             ElevatedButton(
               onPressed: (){
                print("hi"); 
               }, 
               child: Text("Login"),
               style: TextButton.styleFrom() 
               ),
               ],
             ),
           ),
          
        ],
      ),
    );
  }
}
