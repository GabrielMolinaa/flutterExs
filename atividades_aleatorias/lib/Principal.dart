import 'package:flutter/material.dart';
import 'dart:math';

class Principal extends StatefulWidget {

  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  List<String> filosofias = ["The life Snake,","Todo dia nasce com um sol!","O importante não é saber, mas ter o telefone de quem sabe."];
  String fraseSorteada="";
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(70, 72, 209, 204),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Text("Contador Bagaceira",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 128, 128),
              fontSize: 30,
            )),
            Text("$contador",
              style: TextStyle(
              color: Color.fromARGB(255, 0, 206, 209),
              fontSize: 40,
              letterSpacing: 1,
            ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255,32,178,170),
                padding: EdgeInsets.all(30),
              ),
                onPressed: (){
                  setState(() {
                    contador--;
                  });
                },
                child: Text("DECREMENTA"),
            ),
            ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255,32,178,170),
                padding: EdgeInsets.all(30),
              ),
                onPressed: (){
                  setState(() {
                    contador = 0;
                    //fraseSorteada = filosofias[Random().nextInt(3)];
                  });
                  },
                child: Text("RESETAR"),
            ),
                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,32,178,170),
                    padding: EdgeInsets.all(30),
                  ),
                  onPressed: (){
                    setState(() {
                      contador++;
                      //fraseSorteada = filosofias[Random().nextInt(3)];
                    });
                  },
                  child: Text("INCREMENTA"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
