import 'package:flutter/material.dart';


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
        backgroundColor: Colors.white,
        title: Image.asset('images/idr.jpg', width: 120, height: 100),
      ),

      body: Container(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                decoration:InputDecoration(
                  labelText: "Nome Produto",
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Marca Produto"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Preço Produto"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Validade Produto"
                ),
              ),

            ],
          ),
        )
      )
    );
  }
}
