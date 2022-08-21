import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String DisplayNumber = '';

  /// DisplayNum = number.Tostring()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Calculator',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // displqy
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$DisplayNumber',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 72,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // control panel
          Expanded(
            flex: 4,
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Row(
                    children: [
                      FButton('C',Cbtn , Colors.green),
                      FButton('-/+',minus, Colors.green),
                      FButton('%',persontage, Colors.green),
                      FButton('/',kisma, Colors.redAccent),
                    ],
                  ),
                  Row(
                    children: [
                      NumberButton(7),
                      NumberButton(8),
                      NumberButton(9),
                      FButton('x',avg, Colors.redAccent)
                    ],
                  ),
                  Row(
                    children: [
                      NumberButton(4),
                      NumberButton(5),
                      NumberButton(6),
                      FButton('-',mois, Colors.redAccent),
                    ],
                  ),
                  Row(
                    children: [
                      NumberButton(1),
                      NumberButton(2),
                      NumberButton(3),
                      FButton('+',plus, Colors.redAccent),

                    ],
                  ),
          Row(

            children: [

              NumberButton(0),
              FButton('.',point, Colors.white),
              FButton('=',equal, Colors.redAccent)
            ],
          ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget NumberButton(KeyNumber ) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 17,
        ),
        child: Container(
          decoration: BoxDecoration(
            color:   Colors.blueGrey[900],
            borderRadius: BorderRadius.circular(30),
          ),
          height: 80,
          width: 80,
          child: MaterialButton(
            onPressed: () {
              setState(() {
                DisplayNumber = DisplayNumber + '$KeyNumber';
              });
            },
            child: Center(
              child: Text(
                '${KeyNumber.toString()}',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );

  Widget FButton(String text , operation , Color KeyColor) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 17,
        ),
        child: Container(
          decoration: BoxDecoration(
            color:  Colors.blueGrey[900],
            borderRadius: BorderRadius.circular(30),
          ),
          height: 80,
          width: 80,
          child: MaterialButton(
            onPressed: () {
         setState(() {
           ///parameter

           operation() ;

              });





            },
            child: Center(
              child: Text(
                '$text',
                style: TextStyle(
                    fontSize: 35,
                    color: KeyColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );

/// actions


  bool isplus = false;
  bool isminus = false;
  bool isavg = false;
  bool isdividing = false;
  int number1 = 0 ;
  int number2 = 0;


  void Cbtn (){
  DisplayNumber = ' ';
   isplus = false;
   isminus = false;
   isavg = false;
  bool isdividing = false;
}

void minus (){
  DisplayNumber += '-';
  print(isminus);
}

void persontage (){
  int number = int.parse(DisplayNumber);
  double total =number / 100;
  DisplayNumber = total.toString();

}

void point (){
    DisplayNumber += '.';
  }

void plus (){
  isplus = true;
  number1 = int.parse(DisplayNumber);
  DisplayNumber = ' ' ;


}
  void mois (){
    isminus = true;
    number1 = int.parse(DisplayNumber);
    DisplayNumber = ' ' ;



  }
  void avg (){
    isavg = true;
    number1 = int.parse(DisplayNumber);
    DisplayNumber = ' ' ;


  }
  void kisma (){
    isdividing = true;
    number1 = int.parse(DisplayNumber);
    DisplayNumber = ' ' ;



  }

void equal (){
  int total = 0;

  /// if condition
   number2 = int.parse(DisplayNumber);

  if (isplus = true){
     total = number1 + number2;


  }
   if (isminus = true){
     total = number1 - number2;


   }
   if (isavg = true){
     total = number1 * number2;


   }
   if (isdividing = true){

     total = number1 * number2 ;



   }
  DisplayNumber = total.toString();

}
}
