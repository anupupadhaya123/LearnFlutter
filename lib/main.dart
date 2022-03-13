import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/homepage.dart';
import 'package:learn_flutter/pages/login_page.dart';
import 'package:learn_flutter/utils/routes.dart';
import 'package:learn_flutter/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode:ThemeMode.light ,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/" : (context)=> new LoginPage(), //This is object "new" is optional in dart
        MyRoutes.homeRoute : (context)=>HomePage(),
        MyRoutes.loginRoute : (context)=>LoginPage(),
      },
    );
  }
}
