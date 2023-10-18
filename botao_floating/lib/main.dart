import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating"),
      ),
      body: Container(),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: (){print("botão clicado");},
        label: Text("OK"),
        tooltip: "testeeee",
        focusElevation: 70,
        focusColor: Colors.green,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.menu_book, color: Colors.white,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.account_circle,color: Colors.white,)),
          ],
        ),
      ),
    );
  }
}
