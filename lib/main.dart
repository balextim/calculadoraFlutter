import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'funciones/Funciones.dart';

void main() {
  runApp(const Calculadora());
}

class Calculadora extends StatelessWidget {
  const Calculadora({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  String numAux="",caracter1="",resultadoOperacion="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: CrearBotones(),
    );
  }
   Widget CrearBotones() {
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
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("$caracter1", style: TextStyle(fontSize: 45),),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("$resultadoOperacion", style: TextStyle(fontSize: 45),),
                          ),
                        )
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
                    CrearBoton('^'),
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
        case "=":
        case "^":{
          return Padding(
          padding: const EdgeInsets.all(3.0),
          child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.yellow),
            onPressed: (
            ){
              caracter1=caracter1+caracter;
              switch(caracter){
                case 'AC':{
                  setState(() {
                    caracter1="";
                    resultadoOperacion="";
                  });
                  break;
                }
                case "⌫":{
                    setState(() {
                      caracter1=caracter1.substring(0,caracter1.length-2);
                    });
                    break;
                  }
                case "C":{
                 setState(() {
                    caracter1="";
                    resultadoOperacion="";
                 });
                 break;
                }
                case "^":{
                  
                  setState(() {
                    caracter1=caracter1;

                  });
                  break;
                }
                case "=":{
                  double resultado=realizarOperaciones();
                  setState(() {
                    resultadoOperacion='='+resultado.toString();
                  });
                  break;
                }
              }
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
            caracter1=caracter1+caracter;
            setState(() {
              caracter1;
              });
          },
          child:
            Text(caracter, style: TextStyle(fontSize: 35.0),)),
          );
        }
      }
  }

  //funcion para realizar las operaciones
  double realizarOperaciones(){
    double resultado=0.0;
    String reemplazar=caracter1;
    reemplazar=reemplazar.replaceAll('x', '*');
    reemplazar=reemplazar.replaceAll('=', "");

    Parser conv = Parser();
    Expression expression = conv.parse(reemplazar);
    ContextModel context = ContextModel();
    double resultado1 = expression.evaluate(EvaluationType.REAL, context);
    resultado=resultado1;
    caracter1=caracter1.replaceAll('=', '');
    return resultado;
  }
}


