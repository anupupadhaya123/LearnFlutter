import 'package:flutter/material.dart';
import 'package:learn_flutter/models/catalog.dart';
import 'package:learn_flutter/widgets/drawer.dart';
import 'package:learn_flutter/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App", style: TextStyle(
          color: Colors.black
        ),),


        // centerTitle: true,
        // backgroundColor: Colors.white,
        // elevation: 0,
        // iconTheme: IconThemeData(color: Colors.black),
        // title: Text("Catalog App" ,style: TextStyle(
        //   color: Colors.black,
          
          
        // ),),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(

          // itemCount: CatalogModel.items.length,
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              // item: CatalogModel.items[index] ,

              item: dummyList[index] ,
            );
          } ,
          ),
      ),
      drawer: MyDrawer(),
    );
  }
}
 