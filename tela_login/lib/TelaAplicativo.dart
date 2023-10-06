import 'package:flutter/material.dart';

class TelaAplicativo extends StatefulWidget {
  const TelaAplicativo({super.key});

  @override
  State<TelaAplicativo> createState() => _TelaAplicativoState();
}

class _TelaAplicativoState extends State<TelaAplicativo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Logado"),
        centerTitle: true,

      ),

      body: Container(
        padding: EdgeInsets.all(30),
          child: Column(

          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Voltar para a Tela de Login"))
          ],
        )
      ),
    );
  }
}
