

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hidden extends StatelessWidget{



  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(Icons.add_box,size: 50,),
            Text("Hidden Cabinet",style: TextStyle(fontSize: 30),)


          ],

        ),
      )

    );


  }


}