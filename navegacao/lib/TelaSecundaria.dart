import 'package:flutter/material.dart';
import 'TelaPrincipal.dart';

class TelaSecundaria extends StatefulWidget {
  const TelaSecundaria({super.key});

  @override
  State<TelaSecundaria> createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundária"),
      ),

      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
              Navigator.pop(context);
              },
              child: Text("Ir para tela principal"),
            )
          ],
        ),
      ),
    );
  }
}
