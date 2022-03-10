import 'package:flutter/material.dart';
import 'package:learn_flutter/utils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image.asset("assets/images/login.png",
              
              fit: BoxFit.cover,
               ),
            ),
             SizedBox(
               height: 10,
             ),
             Text("Welcome",
             style: TextStyle(
               fontSize: 28,
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
                 height: 40,
               ),
               ElevatedButton(
                 onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                 }, 
                 child: Text("Login"),
                 style: TextButton.styleFrom(
                   minimumSize: Size(120, 50),
                 ) 
                 ),
                 ],
               ),
             ),
            
          ],
        ),
      ),
    );
  }
}
