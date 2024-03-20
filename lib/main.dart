

import 'package:calculator_app/Home.dart';
import 'package:calculator_app/Splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(My_App());

}

class My_App extends StatelessWidget{


  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,

     home: Splash(),

   );

  }





}