import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({super.key});

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool escolha = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Switch"),
      ),

      body: Container(
        child: Column(
          children: [
            SwitchListTile(
              title: Text("Quer receber notificações?"),
                value: escolha,
                subtitle: Text("Serão enviadas 999 notificações por segundo!"),
                onChanged: (value){
                  setState(() {
                    escolha = value;
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}
