import 'package:flutter/material.dart';
import 'package:banco_dados/Produto.dart';
import 'package:banco_dados/Banco.dart';


class Alterar extends StatefulWidget {
  const Alterar({super.key});

  @override
  State<Alterar> createState() => _AlterarState();
}

class _AlterarState extends State<Alterar> {

  @override
  void initState(){
    super.initState();
    getListaProdutos();
  }

  Banco banco = Banco();
  List<Produto> listaProdutos = [];

  getListaProdutos() async {
    List lista = await banco.getProdutos();
    lista.forEach((element) {
      Produto p = Produto();
      p.id = element["id"];
      p.nome = element["nome"];
      p.marca = element["marca"];
      p.preco = element["preco"];
      p.validade = element["validade"];

      setState(() {
        listaProdutos.add(p);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView.builder(
          itemCount: listaProdutos.length,
          itemBuilder: (context,indice){
            return ListTile(
              title: Text(listaProdutos[indice].nome),
              subtitle: Text("Preço: "+listaProdutos[indice].preco.toString() + " - Marca: " + listaProdutos[indice].marca),
              onTap: (){print("Cliquei");},
            );
          }
      ),
    );
  }
}
