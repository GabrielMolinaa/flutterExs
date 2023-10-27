import 'package:flutter/material.dart';
import 'package:nutri_nahima/ConsultarReceita.dart';
import './Components/CardDieta.dart';
import 'Receita.dart';

class Receitas extends StatefulWidget {
  const Receitas({Key? key});

  @override
  State<Receitas> createState() => _ReceitasState();
}

class _ReceitasState extends State<Receitas> {
  List<Map<String, dynamic>> receitas = [];

  @override
  void initState() {
    super.initState();
    Future<List<Map<String, dynamic>>> receitasBanco = quantidadeReceitas();

    receitasBanco.then((value) {
      setState(() {
        receitas.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(receitas);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: receitas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(receitas[index]['id']),
                    subtitle: Text(receitas[index]['calorias'].toString() +
                        " kcal por porção"),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        receitas[index]['caminho'],
                        width: 100,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Receita(
                            receita: receitas[index],
                          ),
                        ),
                      );
                      print(receitas[index]['ingredientes']);
                    },
                    style: ListTileStyle.drawer,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
