import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
        centerTitle: true,
        bottom: TabBar(
          indicatorWeight: 3,
          indicatorColor: Colors.green,
          controller: tabController,

          tabAlignment: TabAlignment.center,
          tabs: [
            Tab(
              text: "Dietas",
              icon: Icon(Icons.list_alt),
            ),
            Tab(
              text: "Dicas Receitas",
              icon: Icon(Icons.fastfood),
            ),
            Tab(
              text: "Marcar Consulta",
              icon: Icon(Icons.calendar_month),

            )
          ],
        ),
      ),
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
