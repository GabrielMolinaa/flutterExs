import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({super.key});

  @override
  State<EntradaCheckbox> createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool controlador = false;
  bool soja = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Entrada Checkbox"),
      ),

      body:
        Container(
          child: Column(
            children: [
              CheckboxListTile(
                  title: Text("Milho"),
                  value: controlador,
                  secondary: Icon(Icons.access_time_outlined),
                  activeColor: Colors.redAccent,

                  onChanged: (value){
                    setState(() {
                      controlador = value!;
                    });
                  }
              ),
              CheckboxListTile(
                  title: Text("Soja"),
                  value: soja,
                  secondary: Icon(Icons.add_card_rounded),
                  activeColor: Colors.redAccent,

                  onChanged: (value){
                    setState(() {
                      soja = value!;
                    });
                  }
              )
            ],
          ),
        ),
    );
  }
}
