import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  List listaMoedas = [];

  Future<Map> buscarCotacao() async {
    String url = "https://blockchain.info/ticker";
    http.Response resposta = await http.get(Uri.parse(url));
    Map<String, dynamic> lista = json.decode(resposta.body);
    return lista;
  }


  String respostaServidor = "";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Cotações"),
      ),
      body: FutureBuilder<Map>(
        future: buscarCotacao(),
        builder: (context, snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              print("Aguardando Conexão");
              respostaServidor = "AGUARDANDO";
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              respostaServidor = "FINALIZADO";

              if(snapshot.hasError){
                respostaServidor = "Erro ao carregar dados da internet.";
              }else{
                snapshot.data?.values.forEach((element) {
                  Map<String, dynamic> moeda = Map();
                  moeda["nome"] = element["symbol"];
                  moeda["cotacao"] = element["buy"];
                  listaMoedas.add(moeda);
                });
              }
              break;

          }
          return Padding(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: listaMoedas.length,
                itemBuilder: (context, indice){
                  return ListTile(
                    title: Text(listaMoedas[indice]["nome"]),
                    subtitle: Text(listaMoedas[indice]["cotacao"].toString()),
                  );
                }
            ),
          );
        },
      ),
    );
  }
}
