import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abas"),
        bottom: TabBar(
          controller: tabController,
            tabs: [
              Tab(
                text: "Pagina 1",
                icon: Icon(Icons.account_circle),
              ),
              Tab(
                  text: "Pagina 2",
                icon: Icon(Icons.add_a_photo_outlined),
              ),
              Tab(
                text: "Pagina 3",
                icon: Icon(Icons.remove_circle_outline_outlined),
              ),
            ]
        ),
      ),

      body: TabBarView(
          controller: tabController)
    );
  }
}
