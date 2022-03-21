// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:learn_flutter/models/catalog.dart';
import 'package:learn_flutter/widgets/drawer.dart';
import 'package:learn_flutter/widgets/item_widget.dart';
import 'package:learn_flutter/widgets/themes.dart';

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
              CatalogList().expand()
            else
              Center(child: CircularProgressIndicator(),
              )
            
           ],
         ),
       ),
     ),
    );
  }

  
}

class CatalogHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             "Catalog App".text.xl4.bold.color(MyTheme.darkBluishColor).make(),
             "Trending Products".text.xl.make()
           ],
         );
  }
}

class CatalogList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
      
    );
  }
}

class CatalogItem extends StatelessWidget {

  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mH8,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder(),)
                    ),
                    child: "Buy".text.make())
                ],
              ),
            ],
          ),)
        ],
      )
    ).white.roundedLg.square(150).make().py(16);
  }
}


class CatalogImage extends StatelessWidget {


  const CatalogImage({
    Key? key,
    required this.image
  }) : super(key: key);

  final String image;
  
  @override
  Widget build(BuildContext context) {
    return Image.network(image).p8().box.rounded.color(MyTheme.creamColor).make().p16().w40(context);

  }
}
