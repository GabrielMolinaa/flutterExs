import 'package:flutter/material.dart';


class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  String resposta = "";

  getDados() async {
    String urlApi = "https://apitempo.inmet.gov.br/estacao/2022-08-29/2022-08-29/A835";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter INMET"),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Informe o código da estação. Ex A385"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Informe a data:"
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top:50),
              child: ElevatedButton(
                onPressed: (){

                },
                child: Text("Pesquisar"),
              )
            ),

            Padding(
              padding: EdgeInsets.only(top:50),
              child: Text(resposta),
            )
          ],
        ),
      ),
    );
  }
}
