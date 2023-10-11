import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  List listaProdutos = [];

  getListaProdutos(){
    for(int i = 0; i<10;i++){
      Map<String,dynamic> produto = Map();
      produto["nome"] = "Nome ${i}";
      produto["descricao"] = "Descrição produto ${i}";
      listaProdutos.add(produto);
    }
    print(listaProdutos);
  }

  @override
  Widget build(BuildContext context) {
    getListaProdutos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Lista'),

      ),
      body: Container(
        child: ListView.builder(
            itemCount: listaProdutos.length,
            itemBuilder: (context,index){

              return ListTile(
                title: Text(listaProdutos[index]["nome"]),
                subtitle: Text(listaProdutos[index]["descricao"]),
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(listaProdutos[index]["nome"]),
                          titlePadding: EdgeInsets.all(30),
                          titleTextStyle: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                          ),
                          content: Text(listaProdutos[index]["descricao"]),
                        );
                      }
                  );
                }
              );

            },
        ),
      )
    );
  }
}
