import 'package:flutter/material.dart';
import 'Components/Card.dart';
class Dietas extends StatefulWidget {
  const Dietas({super.key});

  @override
  State<Dietas> createState() => _DietasState();
}

class _DietasState extends State<Dietas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedCardExample(titulo: 'Café da manhã',tipo: "cafeManha",),
              ElevatedCardExample(titulo: 'Almoço',tipo: "almoco",),
              // ElevatedCardExample(titulo: 'Café da Tarde'),
              // ElevatedCardExample(titulo: 'Janta'),


            ],
          ),
        ),
      )

    );
  }
}
