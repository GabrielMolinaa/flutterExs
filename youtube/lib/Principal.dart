import 'package:flutter/material.dart';
import 'package:youtube/Biblioteca.dart';
import 'package:youtube/EmAlta.dart';
import 'package:youtube/Inicio.dart';
import 'package:youtube/Inscricoes.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  int indiceSelecionado = 0;
  List telas = [Inicio(),EmAlta(),Inscricoes(),Biblioteca()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/youtube-logo-2020.png", width: 100, height: 120,),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.videocam),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.account_circle),
          ),
        ],
      ),

      body: telas[indiceSelecionado],
      bottomNavigationBar: BottomNavigationBar(

        onTap: (indice){
          setState(() {
            indiceSelecionado = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: indiceSelecionado,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Inicio",
              backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: "Em Alta",
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: "Inscrições",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy),
            label: "Biblioteca",
            backgroundColor: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}
