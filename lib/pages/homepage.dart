import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:learn_flutter/models/catalog.dart';
import 'package:learn_flutter/widgets/drawer.dart';
import 'package:learn_flutter/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  //loading Json

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    // Decoding json
    var decodeData = jsonDecode(catalogJson);
    // print(decodeData);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),

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
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16
                  
                ), 
                itemBuilder: (context, index){
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                        child: Text(item.name, style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple
                        ),
                        ),
                      child: Image.network(
                        item.image, 
                        ),
                      footer: Container(
                        child: Text(
                          item.price.toString(), 
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                            padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black
                        ),

                      ),
                        
                      ),
                  );
                },
                itemCount: CatalogModel.items.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
