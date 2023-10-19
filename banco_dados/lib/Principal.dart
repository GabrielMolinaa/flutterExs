import 'package:banco_dados/Alterar.dart';
import 'package:banco_dados/Cadastrar.dart';
import 'package:banco_dados/Listar.dart';
import 'package:flutter/material.dart';
import 'Banco.dart';
import 'package:banco_dados/Produto.dart';
import 'package:banco_dados/Excluir.dart';


class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  int indiceSelecionado = 0;
  List telas = [Listar(),Alterar(), Excluir(),Cadastrar()];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/idr.jpg", width: 150, height: 90),
        backgroundColor: Colors.white,
      ),
      body: telas[indiceSelecionado],
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: indiceSelecionado,
      type: BottomNavigationBarType.shifting,
      onTap: (indice){
        setState(() {
          indiceSelecionado = indice;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Listar",
            backgroundColor: Colors.green
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: "Alterar",
            backgroundColor: Colors.green
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.delete_forever),
            label: "Excluir",
            backgroundColor: Colors.red
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Cadastrar",
            backgroundColor: Colors.green
        ),
      ],
    ),
    );
  }
}


