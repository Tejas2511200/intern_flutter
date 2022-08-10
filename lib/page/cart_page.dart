import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class cartpage extends StatefulWidget {
  const cartpage({Key key}) : super(key: key);

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, 
          title: "cart".text.make(),
        ), 
        body: Column(
          children: [
            _cartlist().p32().expand(),
            Divider(),
            _carttotal(), 
            
          ],
        ));
  }
}

class _carttotal extends StatefulWidget {
  const _carttotal({Key key}) : super(key: key); 

  @override
  State<_carttotal> createState() => _carttotalState();
}

class _carttotalState extends State<_carttotal> {
  @override
  Widget build(BuildContext context) {  
    VxState.watch(context, on: [removemutation]);
     final cartmodel _cart = (VxState.store as mystore).cart; 
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ 
        "\₹${_cart.totalprice}".text.xl5.color(Vx.red400).make(),
        30.widthBox,
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "buying not supported for now".text.make(),
              ));
            }, 
            style: ButtonStyle(
              backgroundColor:  
                        MaterialStateProperty.all(Colors.black),
            ),
            child: "buy".text.color(Vx.white).make()
            ).w20(context)
      ]),
    );
  }
}


class _cartlist extends StatefulWidget{
 
  @override
  State<_cartlist> createState() => _cartlistState();
}

class _cartlistState extends State<_cartlist> {
  @override
  Widget build(BuildContext context) {   
        VxState.watch(context, on: [removemutation]);
         final cartmodel _cart = (VxState.store as mystore).cart; 

    return _cart.items.isEmpty? "Nothing to Show".text.makeCentered(): ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.done), 
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline), onPressed: () { removemutation(_cart.items[index]);
          setState(() {
            
          });
          },
          

        ),  
        
        title: _cart.items[index].name.text.make(),
      ),
    
    );
  }
}