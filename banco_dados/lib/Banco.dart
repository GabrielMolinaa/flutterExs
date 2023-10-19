import 'package:sqflite/sqflite.dart';
import 'package:banco_dados/Produto.dart';
import 'package:path/path.dart';

class Banco {

  buscarBanco() async {
    final caminhoBanco = await getDatabasesPath();
    final localBanco = join(caminhoBanco, "banco.db");

    var bancoDados = await openDatabase(
        localBanco,
        version: 1,
        onCreate: (banco, versaoMaisRecente) {
          String sql = "CREATE TABLE produtos(id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, marca VARCHAR, preco REAL, validade VARCHAR)";
          banco.execute(sql);
        }
    );

    return bancoDados;
  }

  salvar(Produto p) async {
    Database banco = await buscarBanco();
    Map<String, dynamic> produto = {
      "nome": p.nome,
      "marca": p.marca,
      "preco": p.preco,
      "validade": p.validade
    };

    int id = await banco.insert("produtos", produto);
    print("Produto salvo com ID: ${id}");
  }

   getProdutos() async {
    Database banco = await buscarBanco();
    List produtos = await banco.rawQuery("SELECT * FROM produtos");

    return produtos;
  }

  getProduto(int id) async {
    Database banco = await buscarBanco();
    List produto = await banco.query(
        "produtos",
        columns: ["id", "nome", "marca", "validade"],
        where: "id=?",
        whereArgs: [id]
    );
    return produto[0];
  }


  apagarProduto(int id) async {
    Database banco = await buscarBanco();
    int linhasExcluidas = await banco.delete("produtos",where: "id=?",whereArgs: [id]);

    print("Linhas Excluidas: "+linhasExcluidas.toString());
  }

  alterarProdutos(Produto p) async{
    Database banco = await buscarBanco();
    Map<String,dynamic> dadosDoProduto = {
      "nome": p.nome,
      "marca": p.marca,
      "preco": p.preco,
      "validade" : p.validade,
    };

    int numeroMudancas = await banco.update("produtos", dadosDoProduto, where: "id=?", whereArgs: [p.id]);
    print("Quantidade de itens alterados" + numeroMudancas.toString());
  }
}