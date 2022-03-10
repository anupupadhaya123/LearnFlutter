import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/homepage.dart';
import 'package:learn_flutter/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode:ThemeMode.light ,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/login",
      routes: {
        "/" : (context)=> new LoginPage(), //This is object "new" is optional in dart
        "/home" : (context)=>HomePage(),
        "/login" : (context)=>LoginPage(),
      },
    );
  }
}
