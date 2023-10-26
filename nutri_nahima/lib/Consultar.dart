import 'package:flutter/material.dart';

class Consultar extends StatefulWidget {
  const Consultar({super.key});

  @override
  State<Consultar> createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Text("CONSULTAR"),
          ],
        )
    );
  }
}
