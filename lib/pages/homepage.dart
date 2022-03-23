// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:learn_flutter/models/catalog.dart';
import 'package:learn_flutter/widgets/drawer.dart';
import 'package:learn_flutter/widgets/item_widget.dart';
import 'package:learn_flutter/widgets/themes.dart';

import '../widgets/home_widgets/catalog_header.dart';

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
      backgroundColor: MyTheme.creamColor,
     body: SafeArea(
       child: Container(
         padding: Vx.m32,
         child: Column(
          
           children: [
            CatalogHeader(),
            if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().py16().expand()
            else
              CircularProgressIndicator().centered().expand()
              
            
           ],
         ),
       ),
     ),
    );
  }
}


