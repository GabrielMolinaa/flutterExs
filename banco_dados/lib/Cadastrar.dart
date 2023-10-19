import 'package:banco_dados/Banco.dart';
import 'package:flutter/material.dart';
import 'package:banco_dados/Produto.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {

  Banco banco = Banco();
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoMarca = TextEditingController();
  TextEditingController campoPreco = TextEditingController();
  TextEditingController campoValidade = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: campoNome,
            decoration: InputDecoration(
              labelText: "Nome do Produto",
              hintText: "Informe o nome",
            ),
          ),
          TextField(
            controller: campoMarca,
            decoration: InputDecoration(
              labelText: "Marca do Produto",
              hintText: "Informe a marca",
            ),
          ),
          TextField(
            controller: campoPreco,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço do Produto",
              hintText: "Informe o preço",

            ),
          ),
          TextField(
            controller: campoValidade,
            decoration: InputDecoration(
              labelText: "Validade do Produto",
              hintText: "Informe a validade",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              child: Text("SALVAR"),
              onPressed: (){
                print("SALVANDO PRODUTO");
                Produto p = Produto();
                p.nome = campoNome.text;
                p.marca = campoMarca.text;
                p.preco = double.parse(campoPreco.text);
                p.validade = campoValidade.text;
                banco.salvar(p);

                campoNome.text = "";
                campoMarca.text = "";
                campoPreco.text = "";
                campoValidade.text = "";
                final snackBar = SnackBar(
                  content: Text('Produto salvo com sucesso!'),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.green,

                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },

            ),
          ),

        ],
      ),
    );
  }
}
