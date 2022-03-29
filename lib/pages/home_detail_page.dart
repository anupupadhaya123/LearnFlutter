import 'package:flutter/material.dart';
import 'package:learn_flutter/models/catalog.dart';
import 'package:learn_flutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor:context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            "\$${catalog.price}".text.bold.xl4.color(context.accentColor).make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.theme.buttonColor),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Add to Cart".text.make())
                .wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 10.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text.xl.make(),
                      10.heightBox,
                      "Eirmod magna sadipscing amet est et, et eirmod no consetetur sed, invidunt amet et et et eirmod duo elitr. Sed voluptua et dolore rebum gubergren. Lorem ipsum sea labore dolore eirmod et. No sadipscing dolore vero dolor. Consetetur labore sit ut eirmod."
                          .text
                          .make().p16()
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
