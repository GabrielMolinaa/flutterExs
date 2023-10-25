import 'package:flutter/material.dart';

class ResponsividadeLayoutBuilder extends StatefulWidget {
  const ResponsividadeLayoutBuilder({super.key});

  @override
  State<ResponsividadeLayoutBuilder> createState() => _ResponsividadeLayoutBuilderState();
}

class _ResponsividadeLayoutBuilderState extends State<ResponsividadeLayoutBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Builder"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.greenAccent,
        child: LayoutBuilder(
            builder: (context,constraint){
              var largura = constraint.maxWidth;
              var altura = constraint.maxHeight;

              print(largura);
              print(altura);
              if(largura < 767){
                return Text("Tela Celular");
              }else if(largura<1023){
                return Text("Tela Tablet");
              }else{
                return Text("Tela PC");
              }

            }
        ),
      ),
    );
  }
}
