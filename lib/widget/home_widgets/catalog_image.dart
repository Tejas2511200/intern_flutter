import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widget/theme.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      
      image,
    ).box.rounded.p8.color(Vx.gray800).make().p16().w40(context);
  }
}