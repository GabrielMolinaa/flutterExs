import 'package:flutter/material.dart';

class ResponsividadeExpandable extends StatefulWidget {
  const ResponsividadeExpandable({super.key});

  @override
  State<ResponsividadeExpandable> createState() => _ResponsividadeExpandableState();
}

class _ResponsividadeExpandableState extends State<ResponsividadeExpandable> {
  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery
        .of(context)
        .size
        .width;
    var altura = MediaQuery
        .of(context)
        .size
        .height;


    return Scaffold(
      appBar: AppBar(
          title: Text("MediaQuery")
      ),
      body:Column(
      children: [
        Expanded(
        child: Container(
          color: Colors.green,
          child: Text("teste"),
        ),
      ),
      ]),
    );
  }
}
