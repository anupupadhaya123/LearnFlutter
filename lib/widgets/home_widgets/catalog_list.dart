
import 'package:flutter/material.dart';
import 'package:learn_flutter/models/catalog.dart';
import 'package:learn_flutter/pages/home_detail_page.dart';
import 'package:learn_flutter/widgets/home_widgets/catalog_image.dart';
import 'package:learn_flutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailPage(catalog: catalog))),
          child: CatalogItem(catalog: catalog));
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
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
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
                      backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                      shape: MaterialStateProperty.all(StadiumBorder(),)
                    ),
                    child: "Add to cart".text.make())
                ],
              ),
            ],
          ),)
        ],
      )
    ).color(context.cardColor).roundedLg.square(180).make().py(12);
  }
}
