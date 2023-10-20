import 'package:flutter/material.dart';
import 'package:banco_dados/Produto.dart';
import 'package:banco_dados/Banco.dart';


class Alterar extends StatefulWidget {
  const Alterar({super.key});

  @override
  State<Alterar> createState() => _AlterarState();
}

class _AlterarState extends State<Alterar> {

  TextEditingController campoNome = TextEditingController();
  TextEditingController campoMarca = TextEditingController();
  TextEditingController campoPreco = TextEditingController();
  TextEditingController campoValidade = TextEditingController();


  Banco banco = Banco();
  List<Produto> listaProdutos = [];

  getListaProdutos() async {
    List lista = await banco.getProdutos();
    listaProdutos = [];
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
    getListaProdutos();
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView.builder(
          itemCount: listaProdutos.length,
          itemBuilder: (context,indice){
            return ListTile(
              title: Text(listaProdutos[indice].nome),
              subtitle: Text("Preço: "+listaProdutos[indice].preco.toString() + " - Marca: " + listaProdutos[indice].marca),
              onTap: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        Produto p = listaProdutos[indice];
                        campoNome.text = p.nome;
                        campoMarca.text = p.marca;
                        campoPreco.text = p.preco.toString();
                        campoValidade.text=p.validade;

                        return AlertDialog(
                          title: Text("Alterar Produto"),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: "Nome: "
                                  ),
                                  controller: campoNome,
                                ),

                                TextField(
                                  decoration: InputDecoration(
                                      labelText: "Marca: "
                                  ),
                                  controller: campoMarca,
                                ),

                                TextField(
                                  decoration: InputDecoration(
                                      labelText: "Preco: "
                                  ),
                                  controller: campoPreco,
                                ),

                                TextField(
                                  decoration: InputDecoration(
                                      labelText: "Validade: "
                                  ),
                                  controller: campoValidade,
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  Produto p = Produto();
                                  p.id = listaProdutos[indice].id;
                                  p.nome = campoNome.text;
                                  p.marca = campoMarca.text;
                                  p.preco = double.parse(campoPreco.text);
                                  p.validade = campoValidade.text;

                                  banco.alterarProdutos(p);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Produto Alterado com Sucesso!"),
                                          backgroundColor: Colors.green,
                                          duration: Duration(seconds:3),
                                      )
                                  );
                                  Navigator.pop(context);

                                },
                                child: Text("Alterar")),

                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Cancelar")),
                          ],

                        );
                      }
                  );
                },
            );
          }
      ),
    );
  }
}
