import 'package:flutter/material.dart';
import 'package:banco_dados/Produto.dart';
import 'package:banco_dados/Banco.dart';

class Excluir extends StatefulWidget {
  const Excluir({super.key});

  @override
  State<Excluir> createState() => _ExcluirState();
}

class _ExcluirState extends State<Excluir> {

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
            return Dismissible(
                direction: DismissDirection.startToEnd,
                background: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Icon(Icons.remove_circle_outline_outlined,
                      color: Colors.white),
                    ],
                  ) ,
                ),
                onDismissed: (direction){

                },
                key: Key(listaProdutos[indice].id.toString()),
                child: ListTile(
                  title: Text(listaProdutos[indice].nome),
                  subtitle: Text("Preço: "+listaProdutos[indice].preco.toString() + " - Marca: " + listaProdutos[indice].marca),

                ));
          }
      ),
    );
  }
}
