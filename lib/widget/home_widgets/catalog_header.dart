import 'package:flutter/material.dart';
import 'package:flutter_catalog/widget/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class catalogheader extends StatelessWidget {
  const catalogheader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "catalog app".text.xl5.bold.color(MyTheme.darkbluish).make(),
        "tranding products".text.xl.bold.make(),
      ],
    );
  }
}
