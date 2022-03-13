import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configuration/config.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final image = "https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          
          // padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                // decoration: BoxDecoration(
                //   // color: Colors.red,
                // ),
                accountName: Text('Anup Upadhaya'),
                accountEmail: Text("au.anup@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                ),
              ),
            ),
            //List View From Config
          //   Column(   
          //   children: 
          //     drawerItem.map((element) => Row(
          //       children: [
          //         Icon(element['Icon'], color: Colors.white,size: 25,),
          //         SizedBox(
          //           width: 15,
          //         ),
          //         Text(element['title'],style: TextStyle(color: Colors.white, fontSize: 20),),
          //       ],
          //     )).toList()
            
          // ),

            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white, size: 30,),
              title: Text("Home", 
              textScaleFactor: 1.2,
              style: TextStyle(
              color: Colors.white,
               
              ),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white, size: 30,),
              title: Text("Profile", 
              textScaleFactor: 1.2,
              style: TextStyle(
              color: Colors.white,
               
              ),),
            ),

            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white, size: 30,),
              title: Text("E-mail", 
              textScaleFactor: 1.2,
              style: TextStyle(
              color: Colors.white,
               
              ),),
            ),

            ListTile(
              leading: Icon(CupertinoIcons.location_circle, color: Colors.white, size: 30,),
              title: Text("Location", 
              textScaleFactor: 1.2,
              style: TextStyle(
              color: Colors.white,
               
              ),),
            ),
          ],
        ),
      ),
    );
  }
}