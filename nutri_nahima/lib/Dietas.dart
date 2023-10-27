import 'package:flutter/material.dart';
import 'Components/Card.dart';
import 'Components/CustomExpansionPanel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ConsultarReceita.dart';

class Dietas extends StatefulWidget {
  const Dietas({Key? key}) : super(key: key);

  @override
  State<Dietas> createState() => _DietasState();
}

class _DietasState extends State<Dietas> {
  List<bool> _isOpen = [false, false,false,false,false,false];
  List<String> _headerTitles = ['Café da Manhã', 'Lanche da manhã','Almoço','Lanche da tarde','Jantar','Ceia'];
  List<String> _panelTitles = ['Café da Manhã', 'Lanche da manhã','Almoço','Lanche da tarde','Jantar','Ceia'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomExpansionPanelList(
                isOpenList: _isOpen,
                headerTitles: _headerTitles,
                panelTitles: _panelTitles,
                expansionCallback: (i, isOpen) {
                  setState(() {
                    _isOpen[i] = isOpen;
                    print(_isOpen[i]);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
