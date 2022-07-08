import 'package:flutter/material.dart';

//import 'package:flutter_application_1/models/catelog.dart';

import '../models/catelog.dart'; 

class itemwidget extends StatelessWidget {
  final Item item;

  const itemwidget({Key key, @required this.item}): 
  assert(Item != null);
  
 

  @override
  Widget build(BuildContext context) { 
    return Card(
      child: ListTile( 
        onTap: (){

          print("i have press");
        },
        leading: Image.network(item.image), 
        title: Text(item.name), 
        subtitle: Text(item.desc), 
        trailing: Text("\$${item.price}",style: TextStyle(color: Colors.deepPurple),),
      ),
    );
    
  }
}

