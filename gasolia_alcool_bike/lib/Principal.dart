import 'package:flutter/material.dart';


class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  TextEditingController campoGasolina = TextEditingController();
  TextEditingController campoEtanol = TextEditingController();
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text("Gasolina, Álcool ou Bike",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(100, 0, 209, 109),
        shadowColor: Color.fromARGB(200, 0, 209, 109),
      ),
      body: Container(
        padding: EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "imagens/combustivel.jpeg",
                    scale: 2,
                  ),

                  Image.asset(
                    "imagens/bike.jpeg",
                    scale: 1.65,
                  )
                ],
              ),
              Column(

                children: [
                  Text(
                    resultado,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 150, 220),
                      height: 1.5,
                    ),
                  ),
                  TextField(
                    controller: campoGasolina,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valor da Gasolina",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 80, 20),
                      ),
                    ),
                  ),
                  TextField(
                    controller: campoEtanol,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valor do Etanol",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 80, 20),
                      )
                    ),
                  ),
                  ElevatedButton(

                      onPressed: (){
                        campoGasolina.text = campoGasolina.text.replaceAll(',', '.');
                        campoEtanol.text = campoEtanol.text.replaceAll(',', '.');
                        double valorGasolina = double.parse(campoGasolina.text);
                        double valorEtanol = double.parse(campoEtanol.text);
                        if(valorGasolina == 0 || valorGasolina == 0){
                          setState(() {
                            resultado = "Digite um valor Válido";
                          });
                        }else if(valorGasolina > 10 && valorEtanol > 10){
                          setState(() {
                            resultado = ("Vai de Bike Mano! Economiza!");
                          });
                        }else if((valorEtanol/valorGasolina) >= 0.7){
                          setState(() {
                            resultado = "Melhor colocar Gasolina!";
                          });
                        }else{
                          setState(() {
                            resultado = "Melhor colocar Etanol!";
                          });
                        }

                      },
                      child: Text("Calcular"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

