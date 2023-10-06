import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
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
        title: Text("Principal"),
      ),

      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            GestureDetector(
              child: Image.asset("imagens/bike.jpeg"),
              onTap: (){
                print("Cliquei");
              },
              onLongPress: (){
                print("Longo");
              },
              onDoubleTap: (){
                print("Double tap");
              },
            ),
            Image.asset("imagens/combustivel2.jpeg"),
          ],
        ),
      ),

    );
  }
}



