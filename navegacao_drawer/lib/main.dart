import 'package:flutter/material.dart';
import 'package:navegacao_drawer/Pagina1.dart';
import 'package:navegacao_drawer/Pagina2.dart';
import 'package:navegacao_drawer/Pagina3.dart';

void main() {
  runApp(MaterialApp(
    home: Principal(),
    debugShowCheckedModeBanner: false,
  ));
}

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  int indice = 0;
  List telas = [
    Pagina1(),
    Pagina2(),
    Pagina3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navegação"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Drawer Header",style: TextStyle(color: Colors.white,fontSize: 30),),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
            ),
            ListTile(
              title: Text("Pagina 1"),
              leading: Icon(Icons.add),
              onTap: (){
                setState(() {
                  indice = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Pagina 2"),
              leading: Icon(Icons.add_card_rounded),
              onTap: (){
                setState(() {
                  indice = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Pagina 3"),
              leading: Icon(Icons.add_a_photo_outlined),
              onTap: (){
                setState(() {
                  indice = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: telas[indice],
    );
  }
}


