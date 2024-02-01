import 'package:flutter/material.dart';
import 'Principal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  iniciaFirebase();
  runApp(MaterialApp(
    home: Principal(),
    debugShowCheckedModeBanner: false,
  ));
}

void iniciaFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;

  //mockProjetos(db);
  //mockAtividades(db);
  //mockVariaveis(db);
  buscarAtividadesComTag(db, 'tag15');
  //buscarAtividadesComLocalEspecifico(db, 'Local4');
}

void buscarAtividadesComTag(FirebaseFirestore db, String tag) async {
  // Realizar a consulta
  QuerySnapshot querySnapshot = await db.collection('atividades').get();

  // Procurar atividades com a tag desejada
  querySnapshot.docs.forEach((DocumentSnapshot document) {
    List<dynamic> tags = document.get('tags');

    if (tags != null && tags.contains(tag)) {
      // Encontrou uma atividade com a tag desejada
      print('Atividade: ${document.data()}');
      print('---');
    }
  });
}

void buscarAtividadesComLocalEspecifico(FirebaseFirestore db, String nomeLocal) async {
  // Realizar a consulta
  QuerySnapshot querySnapshot = await db.collection('atividades').get();

  // Procurar atividades com o local desejado
  querySnapshot.docs.forEach((DocumentSnapshot document) {
    List<dynamic> locais = document.get('local');

    if (locais != null) {
      // Iterar sobre os locais da atividade
      for (var local in locais) {
        // Verificar se o nome do local coincide
        if (local['nomeLocal'] == nomeLocal) {
          // Encontrou uma atividade com o local desejado
          print('Atividade: ${document.data()}');
          print('---');
          break;  // Interrompe a iteração após encontrar a atividade desejada
        }
      }
    }
  });
}


void buscarAtividadeComVarRef(FirebaseFirestore db, String varRef) async {
  // Realizar a consulta
  QuerySnapshot querySnapshot = await db.collection('atividades').get();

  // Procurar a atividade com varRef igual ao desejado
  querySnapshot.docs.forEach((DocumentSnapshot document) {
    List<dynamic> locais = document.get('local');

    for (var local in locais) {
      List<dynamic> agrupamentos = local['agrupamento'];

      for (var agrupamento in agrupamentos) {
        List<dynamic> variaveis = agrupamento['variaveis'];

        for (var variavel in variaveis) {
          if (variavel['_varRef'] == varRef) {
            // Encontrou uma atividade com varRef igual ao desejado
            print('Atividade ID: ${document.id}');
            print('Nome da Atividade: ${document['nome']}');
            // Adicione mais campos conforme necessário
            print('---');
            break;  // Interrompe a iteração após encontrar a atividade desejada
          }
        }
      }
    }
  });
}


void mockProjetos(FirebaseFirestore db) async {
  CollectionReference projetos = db.collection('projetos');

  // Adicionar vários projetos fictícios
  for (int i = 1; i <= 5; i++) {
    await projetos.doc('projeto$i').set({
      'nome': 'Projeto $i',
      'programaPesquisa': 'Recursos Naturais',
      'estatistica': 'Estatistica',
      'tags': ['tag${i * 2 - 1}', 'tag${i * 2}', 'tag${i * 2 + 1}'],
      'dataCriacao': '2024-01-20',
      'objetoEstudo': ['objeto$i'],
      'atividades': [
        {'atvRef': 'atividade${i * 2 - 1}'},
        {'atvRef': 'atividade${i * 2}'}
      ],
    });
  }
}

void mockAtividades(FirebaseFirestore db) async {
  CollectionReference atividades = db.collection('atividades');

  // Adicionar várias atividades fictícias
  for (int i = 1; i <= 5; i++) {
    await atividades.doc('atividade${i * 2 - 1}').set({
      'nome': 'Atividade ${i * 2 - 1}',
      'tags': ['tag${i * 4 - 3}', 'tag${i * 4 - 2}', 'tag${i * 4 - 1}'],
      'objetoEstudo': 'objeto$i',
      'projeto': 'projeto$i',
      'local': [
        {
          'nomeLocal': 'Local${i}',
          'agrupamento': [
            {
              'nomeAgrupamento': 'Agrupamento${i}',
              'variaveis': [
                {
                  '_varRef': 'var${i * 2 - 1}',
                  'dataColeta': '2024-01-24',
                  'geoLoc': '-23.4273,-51.9375',
                  'valor': '$i.0',
                }
              ],
            }
          ],
        }
      ],
    });

    await atividades.doc('atividade${i * 2}').set({
      'nome': 'Atividade ${i * 2}',
      'tags': ['tag${i * 4}', 'tag${i * 4 + 1}', 'tag${i * 4 + 2}'],
      'objetoEstudo': 'objeto$i',
      'projeto': 'projeto$i',
      'local': [
        {
          'nomeLocal': 'Local${i}',
          'agrupamento': [
            {
              'nomeAgrupamento': 'Agrupamento${i}',
              'variaveis': [
                {
                  '_varRef': 'var${i * 2}',
                  'dataColeta': '2024-01-24',
                  'geoLoc': '-23.4273,-51.9375',
                  'valor': '${i + 0.5}',
                }
              ],
            }
          ],
        }
      ],
    });
  }
}

void mockVariaveis(FirebaseFirestore db) async {
  CollectionReference variaveis = db.collection('variaveis');

  // Adicionar várias variáveis fictícias
  await variaveis.doc('etmologia').set({
    'variaveis': [
      {'ObjectID': 'var1', 'nome': 'Variavel 1', 'tipo': 'tipo1'},
      {'ObjectID': 'var2', 'nome': 'Variavel 2', 'tipo': 'tipo2'},
    ],
  });

  await variaveis.doc('agrometeorologia').set({
    'variaveis': [
      {'ObjectID': 'var3', 'nome': 'Variavel 3', 'tipo': 'tipo3'},
      {'ObjectID': 'var4', 'nome': 'Variavel 4', 'tipo': 'tipo4'},
    ],
  });
}
