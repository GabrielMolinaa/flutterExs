import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';


Future<Map<int, List<String>>> consultarAgenda() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;

  QuerySnapshot consultas = await db.collection("agenda").get();

  Map<int, List<String>> horariosAgendados = {};

  consultas.docs.forEach((element) {
    Timestamp timestamp = element["data"];
    DateTime dateTime = timestamp.toDate();

    String formattedTime = DateFormat('HH:mm').format(dateTime);
    int day = dateTime.day;

    if (horariosAgendados.containsKey(day)) {
      horariosAgendados[day]!.add(formattedTime);
    } else {
      horariosAgendados[day] = [formattedTime];
    }
  });

  return horariosAgendados;
}


void adicionarConsulta(DateTime data, String nome) {

  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseFirestore.instance.collection('agenda').add({
    'data': data,
    'nome': nome,
  }).then((value) {
    print("Consulta adicionada com sucesso!");
  }).catchError((error) {
    print("Erro ao adicionar consulta: $error");
  });
}

