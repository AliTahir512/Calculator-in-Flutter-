
import 'package:calculator_app/HiddenCabinet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class HomeCalc extends StatefulWidget{

  State<HomeCalc> createState() {

  return HomeCalcState();

   }

}

class HomeCalcState extends State<HomeCalc>{



  final List<String> buttons=[

    "0", "C","=","-","3","2","1","+","6","5","4","*","9","8","7","/"

  ];


  String equation="";
  String result="";


  void initState() {
    super.initState();
  }


  void handleButton(String button){

    setState(() {

      if(button=="C"){
        equation="";
        result="";
      }
      else if(button=="="){

        try{
        result=EvaluateExpresion(equation);

        if(result=="1001"){

          Navigator.push(context, MaterialPageRoute(builder: (context)=>Hidden()));

        }



        }
        catch(e){
          result="error";
        }

      }
      else{
        equation=equation+button;
      }

    });
  }

 String EvaluateExpresion(String eq){

   try {
     Parser parser = Parser();
     Expression exp = parser.parse(eq);
     ContextModel cm = ContextModel();
     double evalResult = exp.evaluate(EvaluationType.REAL, cm);
      String formatted=FormatResult(evalResult);

     return formatted;
   } catch (e) {
     return "Error";
   }

 }

 String FormatResult(double result){

   String formattedResult = result.toStringAsFixed(1); // Format to one decimal place
   if (formattedResult.endsWith('.0')) {
     return result.toInt().toString(); // If it's a whole number, remove ".0"
   } else {
     return formattedResult; // Keep the decimal part if it's not a whole number
   }




 }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("My Calculator",style:
        TextStyle(color: Colors.white,fontFamily: "Mooli"),)),
      backgroundColor: Colors.black,
      ),

      body: Column(
        children: [

          Text(equation,style: TextStyle(fontSize: 40,fontFamily: "Mooli"),),


          Text(result,style: TextStyle(fontSize: 30,fontFamily: "Mooli"),),

          Expanded(
            child: Container(

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,

              child:

                  GridView.builder(

                    reverse: true,


                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                        (crossAxisCount: 4,
                         crossAxisSpacing: 3.0),

                      itemBuilder: (context,int index){


                        return ElevatedButton(onPressed: (){

                          handleButton(buttons[index]);

                        }, child: Text
                          (buttons[index],style: TextStyle(fontSize: 30,color: Colors
                            .black,fontFamily: "Mooli",fontWeight: FontWeight.bold),),

                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                          shadowColor: Colors.black



                        ),
                        );
                      },

                      itemCount: buttons.length,





                  ),

              ),
          ),
        ],
      ),
      );





  }

}