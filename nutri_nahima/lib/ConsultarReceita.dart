

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';


Future<Map<String,dynamic>> consultarReceita() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;

  DocumentSnapshot todos = await db.collection("receitas_lowCarb").doc("pães low carb").get();
  Map<String,dynamic>? map = {};

  Map<String, dynamic> data = todos.data() as Map<String, dynamic>;

  // todos.docs.forEach((element) {
  //   var dado = element.data() as Map<String,dynamic>;
  //   print(dado);
  // });



  return data;

}
Future<List<Map<String, dynamic>>> quantidadeReceitas() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> receitas = [];

  QuerySnapshot nomeReceitas = await db.collection("receitas_lowCarb").get();

  for (var doc in nomeReceitas.docs) {
    Map<String, dynamic> receita = {
      'id': doc.id,
      'calorias': doc['calorias'],
      'caminho': doc['caminho'],
      'ingredientes': doc['ingredientes'],
      'modo de preparo': doc['modo de preparo'],

    };
    receitas.add(receita);
  }
  return receitas;
}


