import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  @override
  void initState() {
    super.initState();

    lerArquivo().then((conteudo) {
      setState(() {
        listaItems = json.decode(conteudo);
      });
    });
  }


  List listaItems = [];
  TextEditingController campoItem = TextEditingController();

  salvarArquivo() async{
    final diretorio = await getApplicationDocumentsDirectory();
    print("diretorio==>" + diretorio.path);
    File arquivo = File(diretorio.path+"/arquivo.json");

    String conteudo = json.encode(listaItems);
    arquivo.writeAsString(conteudo);

  }

  lerArquivo() async{

    try{
      final diretorio = await getApplicationDocumentsDirectory();
      File arquivo = File(diretorio.path+"/arquivo.json");

      return arquivo.readAsString();

    }catch(erro){
      print("ERRO NA LEITURA" + erro.toString());
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Tarefas"),
      ),

      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: listaItems.length,
                itemBuilder: (context,indice){
                  return CheckboxListTile(
                      title: Text(listaItems[indice]['nome']),
                      value: listaItems[indice]['finalizado'],
                      onChanged: (valor){
                        setState(() {
                          listaItems[indice]['finalizado'] = valor;
                          salvarArquivo();
                        });
                      });

                },
              )
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Adicionar Item"),
                content: TextField(
                  decoration: InputDecoration(
                    labelText: "Digite o item a incluir"
                  ),
                  controller: campoItem,
                ),
                actions: [
                  ElevatedButton(
                      onPressed: (){
                        Map<String,dynamic> item = Map();
                        item['nome'] = campoItem.text;
                        item['finalizado'] = false;
                        setState(() {
                          listaItems.add(item);
                          salvarArquivo();
                        });
                        campoItem.text = "";
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Item Adicionado com Sucesso!"),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.green,
                            )
                        );
                        },
                      child: Text("SALVAR"),
                  ),
                ],

              );
            }
          );


        },
        label: Text("Adicionar a lista"),
        icon: Icon(
            Icons.add_business,

        ),
      ),
    );
  }
}
