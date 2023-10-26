

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';


Future<Map<String,dynamic>> consultarDieta(String tipos) async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;

  String tipo = tipos;
  DocumentSnapshot todos = await db.collection("users").doc('gabrielmolinadelima@hotmail.com').collection("dieta").doc(tipo).get();
  Map<String,dynamic>? map = {};

  Map<String, dynamic> data = todos.data() as Map<String, dynamic>;
  print(data);

  // todos.forEach((element) {
  //   var dado = element.data() as Map<String,dynamic>;
  //   map.addAll(dado);
  //   print(dado);
  // });


  return data;

}


