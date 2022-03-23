
import 'package:learn_flutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

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