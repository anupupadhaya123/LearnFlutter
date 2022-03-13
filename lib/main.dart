import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/homepage.dart';
import 'package:learn_flutter/pages/login_page.dart';
import 'package:learn_flutter/utils/routes.dart';

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
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/" : (context)=> new LoginPage(), //This is object "new" is optional in dart
        MyRoutes.homeRoute : (context)=>HomePage(),
        MyRoutes.loginRoute : (context)=>LoginPage(),
      },
    );
  }
}
