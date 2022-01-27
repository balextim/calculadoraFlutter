
import 'package:flutter/material.dart';

class CrearBotones extends StatelessWidget {
   String numero ="0";
  CrearBotones();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               decoration: BoxDecoration(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children:<Widget> [
                        Container(
                          child: Text("$numero"),
                        ),
                        Container()
                      ],
                    ),
                  ),
             ),
           ),
         ),
         Expanded(
           flex: 2,
            //child: Container(
            //decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: GridView.count(crossAxisCount: 4,
                children: [
                    CrearBoton('AC'),
                    CrearBoton('C'),
                    CrearBoton('⌫'),
                    CrearBoton('+'),
                    CrearBoton('1'),
                    CrearBoton('2'),
                    CrearBoton('3'),
                    CrearBoton('-'),
                    CrearBoton('4'),
                    CrearBoton('5'),
                    CrearBoton('6'),
                    CrearBoton('x'),
                    CrearBoton('7'),
                    CrearBoton('8'),
                    CrearBoton('9'),
                    CrearBoton('÷'),
                    CrearBoton('0'),
                    CrearBoton('.'),
                    CrearBoton('xⁿ'),
                    CrearBoton('=')
                  ],
                ),
            ),
            //),
          ),
        ],
      ),
    );
  }
  Widget CrearBoton(String caracter){
      switch(caracter){
        case "AC":
        case "C":
        case "⌫":
        case "+":
        case "-":
        case "x":
        case "÷":
        case "=":
        case "xⁿ":{
          return Padding(
          padding: const EdgeInsets.all(3.0),
          child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.yellow),
            onPressed: (
            ){
              numero=caracter;
          },
          child:
            Text(caracter, style: TextStyle(fontSize: 35.0),)),
          );
        }
        default:{
          return Padding(
          padding: const EdgeInsets.all(3.0),
          child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.grey),
            onPressed: (
              
            ){
            //todo
            numero=caracter;
          },
          child:
            Text(caracter, style: TextStyle(fontSize: 35.0),)),
          );
        }
      }
  }
}
      
//}