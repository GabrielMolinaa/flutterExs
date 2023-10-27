import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Dietas.dart';
import 'Receitas.dart';
import 'Consultar.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  String nome = '';
  late TabController tabController;

  @override
  void initState(){
    super.initState();
    getName().then((value){
      setState(() {
        nome = value;
      });
    });
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }
  int indiceSelecionado = 0;
  List telas = [Dietas(), Receitas(),Consultar()];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (indice){
            setState(() {
              indiceSelecionado = indice;
            });
          },
          indicatorColor: Colors.green,
          selectedIndex: indiceSelecionado,
          backgroundColor: Colors.white,
          height: 60,

          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorShape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.list_alt, color: Colors.green),
              selectedIcon: Icon(Icons.list_alt, color: Colors.white),
              label: "Dietas",

            ),
            NavigationDestination(
              icon: Icon(Icons.fastfood, color: Colors.green),
              selectedIcon: Icon(Icons.fastfood, color: Colors.white),
              label: "Receitas",

            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month, color: Colors.green),
              selectedIcon: Icon(Icons.calendar_month, color: Colors.white),
              label: "Consultar",


            ),
          ],
      ),

      body: telas[indiceSelecionado],
    );
  }

  Future<String> getName() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db.collection("users").doc('gabrielmolinadelima@hotmail.com').get();
    return snapshot.get('nome');

  }
}
