import 'package:flutter/material.dart';
import 'package:flutter_catalog/widget/home_widgets/add_to_cart.dart';
import 'package:flutter_catalog/widget/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catelog.dart';

class homedetailpage extends StatelessWidget {
  final Item catalog;
  const homedetailpage({Key key, this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(),  
      backgroundColor: Colors.black,
      bottomNavigationBar:  ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl4.red500.make().pOnly(left: 23),
                 addtocart(catalog: catalog,).wh(100,50).pOnly(right: 23)
                ],
              ).py32(),
      body: Column(
        children: [
           Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h20(context),
          Expanded( 
            child: VxArc( 
              height: 40.0, 
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container( 
                width: context.screenWidth,
                color: Vx.gray900, 
                child: Column(children: [
                   catalog.name.text.xl4.color(MyTheme.darkbluish).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).color(Vx.white).make(),
              10.heightBox, 
              "Sit lorem labore tempor tempor takimata dolor tempor dolor diam. Nonumy sit ipsum amet lorem, eos lorem et eirmod et.".text.color(Vx.white).make()
                ]).py64()
              ),
            ),
          )
        ],
      ),
    );
  }
}
