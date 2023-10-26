import 'package:flutter/material.dart';

class Receitas extends StatefulWidget {
  const Receitas({super.key});

  @override
  State<Receitas> createState() => _ReceitasState();
}

class _ReceitasState extends State<Receitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Text("RECEITAS"),
          ],
        )
    );
  }
}
