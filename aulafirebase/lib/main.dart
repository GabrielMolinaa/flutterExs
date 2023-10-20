import 'package:flutter/material.dart';
import 'Principal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



void main() {

  iniciaFirebase();
  //autenticar();

  runApp(MaterialApp(
    home: Principal(),
    debugShowCheckedModeBanner: false,
  ));
}

void iniciaFirebase() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
  
  //inserir funcionario
  //db.collection("funcionarios").doc("005").set({'nome':"Gabriolo",'email':"90"});

  //auto increment
  // db.collection("funcionarios").add({'nome':'doido', 'idade':'30'});

  //obter indice
  // DocumentReference ref = await db.collection("funcionarios").add({'nome':'doido', 'idade':'30'});
  // print("USER REF" + ref.toString());

  //alterar funcionario
  // db.collection("funcionarios").doc("005").set({'nome':'JABULA'});

  //remover
 // db.collection("funcionarios").doc('005').delete();

  //inserir produtos
  //db.collection("produtos").doc("001").set({'nome':'Soja','marca':'IDR','preco':11,'validade':'10/11/2023'});
  //db.collection("produtos").doc("002").set({'nome':'Milho','marca':'IDR','preco':5,'validade':'10/12/2023'});
  //db.collection("produtos").doc("003").set({'nome':'Café','marca':'IDR','preco':13,'validade':'10/01/2024'});
  //db.collection("produtos").doc("004").set({'nome':'Batata','marca':'IDR','preco':2,'validade':'10/02/2024'});
  //db.collection("produtos").doc("005").set({'nome':'Alface','marca':'IDR','preco':19.2,'validade':'10/03/2024'});
  //db.collection("produtos").doc("006").set({'nome':'Cenoura','marca':'IDR','preco':1.5,'validade':'10/04/2024'});
  //db.collection("produtos").doc("007").set({'nome':'Beterraba','marca':'IDR','preco':1.21,'validade':'10/05/2024'});

  //Buscar produto
  // DocumentSnapshot snapshot = await db.collection("produtos").doc('005').get();
  //
  // print('NOME: '+snapshot.get('nome'));
  // print('Marca: ' + snapshot.get('marca'));
  // print('Preco: ' + snapshot.get('preco').toString());

  //buscar todos produtos
  // QuerySnapshot todos = await db.collection("produtos").get();
  //
  // todos.docs.forEach((element) {
  //   var dado = element.data() as Map<String, dynamic>;
  //   print(dado['nome'] + ' '+dado['preco'].toString());
  // });

  //ouvindo as mudanças no banco firebase (Listener)
  // db.collection("produtos").snapshots().listen((event) {
  //   event.docs.forEach((item) {
  //     var dado = item.data() as Map<String, dynamic>;
  //     print(dado['nome'] + ' '+dado['preco'].toString());
  //   });
  // });

  //filtros

  final todos = db.collection("produtos").where("preco", isLessThan: 20).orderBy('preco').orderBy('nome',descending: false).get().then((QuerySnapshot snapshot){
    snapshot.docs.forEach((element){

      print("${element.data()}");
    });
  });

}

void autenticar() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;

  String email ="gabrielmolinadelima@hotmail.com";
  String senha = "123456"; //necessário 6 digitos

  // auth.createUserWithEmailAndPassword(
  //     email: email,
  //     password: senha
  // ).then((retornoFirebase) => {
  //   print("Usuario Cadastrado: ${retornoFirebase.user!.email}")
  // }).catchError((erro){
  //   print("Erro ao cadastrar: ${erro.toString()}");
  // });

  //desloga user
  //auth.signOut();

  //ver se o usuário está logado
  //User? usuario = await auth.currentUser;
  // if(usuario == null){
  //   print("Usuario Deslogado!");
  // }else{
  //   print("Usuario Logado: ${usuario.email.toString()}");
  // }

  //Logando Usuario
  // auth.signInWithEmailAndPassword(
  //     email: email,
  //     password: senha).then((usuario){
  //     print("Usuario logado: ${usuario.user!.email}");
  // }).catchError((erro){
  //   print("Erro ao logar: ${erro.toString()}");
  // });

}