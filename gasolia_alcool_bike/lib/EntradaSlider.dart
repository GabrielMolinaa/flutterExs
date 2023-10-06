import "package:flutter/material.dart";

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({super.key});

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double valor = 0;
  String meuLabel = "5";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Slider"),
      ),

      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Slider(
                value: valor,
                min: 0,
                max: 10,
                label: meuLabel,
                divisions: 20,
                activeColor: Colors.red,
                
                onChanged: (double value){
                  setState(() {
                  valor = value;
                  meuLabel = valor.toString();
                  });
                }
            ),
            ElevatedButton(
                onPressed: (){
                  print("Valor: "+ valor.toString());
                },
                child: Text("Ver Valor"),
            )
          ],
        )
      ),
    );
  }
}
