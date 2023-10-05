import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Meu Primeiro App",
    home: Container(
      //color: Colors.yellow,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.yellow,
          border: Border.all(
              color: Colors.red,
              width: 2,
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("Texto1"),
          Text("Texto2"),
          Text("Texto3"),

        ],
      ),
    ),
  ));


}
