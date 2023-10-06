import 'package:flutter/material.dart';


class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({super.key});

  @override
  State<EntradaRadioButton> createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String escolhaUsuario = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada RadionButton"),
      ),

      body:
        Container(
          child: Column(
            children: [
              RadioListTile(
                title: Text("Não Binare"),
                  value: "Não Binare",
                  groupValue: escolhaUsuario,
                  onChanged: (String? value){
                    setState(() {
                      escolhaUsuario = value!;
                    });
                  }
              ),
              RadioListTile(
                  title: Text("Feminino"),
                  value: "Feminino",
                  groupValue: escolhaUsuario,
                  onChanged: (String? value){
                    setState(() {
                      escolhaUsuario = value!;
                    });
                  }
              ),
              RadioListTile(
                title: Text("Masculino"),
                  value: 'Masculino',
                  groupValue: escolhaUsuario,
                  onChanged: (String? value){
                    setState(() {
                      escolhaUsuario = value!;
                    });
                  },
              ),
              ElevatedButton(
                  onPressed: (){
                    print("Escolha: " + escolhaUsuario);
                  },
                  child: Text("Ver Resultado"),
              ),
            ],
          ),
        ),
    );
  }
}
