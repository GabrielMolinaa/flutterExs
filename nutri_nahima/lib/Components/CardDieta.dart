import 'package:flutter/material.dart';
import '../ConsultarReceita.dart';

class CardReceita extends StatefulWidget {
  final String titulo;
  final String tipo;
  const CardReceita({required this.titulo,required this.tipo, Key? key}) : super(key: key);

  @override
  _CardReceitaState createState() => _CardReceitaState();
}

class _CardReceitaState extends State<CardReceita> {
  Map<String, dynamic> dieta = {};

  @override
  void initState() {
    super.initState();
    consultarReceita().then((value) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  widget.titulo,

                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: dieta.isNotEmpty
                      ? dieta[widget.tipo].length
                      : 1, // Retorna 1 se o mapa estiver vazio
                  itemBuilder: (context, index) {
                    if (dieta.isNotEmpty) {
                      var keys = dieta[widget.tipo].keys.toList();
                      var values = dieta[widget.tipo].values.toList();
                      return ListTile(
                        title: Text(
                          '- ${values[index]}',
                        ),
                      );
                    } else {
                      return ListTile(
                        title: Text('Carregando...'),
                      );
                    }
                  },
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

