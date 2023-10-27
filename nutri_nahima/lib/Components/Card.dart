import 'package:flutter/material.dart';
import '../ConsultarDieta.dart';

class ElevatedCardExample extends StatefulWidget {
  final String titulo;
  final String tipo;
  const ElevatedCardExample({required this.titulo, required this.tipo, Key? key}) : super(key: key);

  @override
  _ElevatedCardExampleState createState() => _ElevatedCardExampleState();
}

class _ElevatedCardExampleState extends State<ElevatedCardExample> {
  Map<String, dynamic> dieta = {};

  @override
  void initState() {
    super.initState();
    consultarDieta(widget.tipo).then((value) {
      setState(() {
        dieta.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text("Carbo: " + "${dieta.isNotEmpty ? dieta['carbo'] : 'Carregando...'}"),
                
              ),
              ListTile(
                title: Text("Proteína: "+"${dieta.isNotEmpty ? dieta['proteina'] : 'Carregando...'}"),
              ),
              ListTile(
                title: Text("Fruta: " + "${dieta.isNotEmpty ? dieta['fruta'] : 'Carregando...'}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
