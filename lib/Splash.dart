
import 'package:calculator_app/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Splash extends StatefulWidget{


  State<Splash> createState() {
    return SplashState();
  }

}

class SplashState extends State<Splash>{



  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2),(){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
      =>HomeCalc()));


    });


    super.initState();
  }


  void dispose() {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values );
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [

            Icon(Icons.calculate,size: 50,),

            Container(

              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xffcfd9df),Color(0xffe2ebf0)
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                  )
              ),

              child: Center(
                child: Text("Pocket Calculator",style: TextStyle
                  (fontSize: 40,
                    fontFamily: "Mooli"  ),),
              ),

            ),
          ],
        ),
      ),


    );
  }

}