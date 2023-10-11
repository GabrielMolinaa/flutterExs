import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_api/lista_cidades_brasil.dart' as lista;

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  String respostaWeb = "";
  TextEditingController campoCidade = TextEditingController();
  TextEditingController campoEstado = TextEditingController();

  String campoCidadeTratado = "";
  String campoEstadoTratado = "";
  int codIbge = 0;
  int index =0;
  DateTime dataHoje = DateTime.now();
  String data = "";

  getDados() async {
    
    if(campoCidade.text.isNotEmpty && campoEstado.text.isNotEmpty) {
      data = '${dataHoje.day}/${dataHoje.month}/${dataHoje.year}';

      campoCidadeTratado =
          lista.ListaCidadesBrasilUppercase.formatarNomeUppercase(
              campoCidade.text);
      campoEstadoTratado = campoEstado.text.toUpperCase();
      List cidades = lista.ListaCidadesBrasilUppercase.listarCidadesUpperCase(
          campoCidadeTratado);

      cidades.forEach((element) {
        if (lista.ListaCidadesBrasil.listaCidadesBrasil[element].contains(
            campoEstado.text)) {
          index = element;
        }
      });

      codIbge = lista.ListaCidadesBrasil.listaIdCidades[index];

      String urlApi = "https://apiprevmet3.inmet.gov.br/previsao/$codIbge";
      http.Response response = await http.get(Uri.parse(urlApi));
      Map<String, dynamic> resposta = json.decode(response.body);
      var cabecalho = resposta['$codIbge']['$data']['manha'];

      setState(() {
        respostaWeb = (
            'Data: $data\n'+'Cidade: ${cabecalho['entidade']} - ${cabecalho['uf']}\n' +
                'Temperatura Máxima: ${cabecalho['temp_max'].toString()}° \n' +
                'Temperatura Mínima: ${cabecalho['temp_min'].toString()}° \n' +
                'Resumo: ${cabecalho['resumo']} \n'
        );
      });
    }else{
      setState((){
      respostaWeb = "Favor, preencha os campos corretamente!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Previsão do Tempo de Hoje"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Image.asset('Imagens/iconeTempo.png',
            width: 100),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: campoCidade,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Informe o nome da Cidade: Ex: Londrina"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: campoEstado,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Informe a Sigla do estado. Ex: PR"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),

            ),

            Padding(
              padding: EdgeInsets.only(top:20),
              child: ElevatedButton(
                onPressed: (){
                  getDados();
                },
                child: Text("Pesquisar"),
              )
            ),

            Padding(
              padding: EdgeInsets.only(top:50),
              child: Text(respostaWeb,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),),
            )
          ],
        ),
      ),
    );
  }
}
