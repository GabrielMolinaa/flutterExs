import 'package:flutter/material.dart';
import 'Responsividade_MediaQuery.dart';
import 'ResponsividadeExpandable.dart';
import 'package:multiplataforma/ResponsividadeWrap.dart';
import 'ResponsividadeOrientacao.dart';
import 'ResponsividadeLayoutBuilder.dart';

void main() {
  runApp(MaterialApp(
    home: ResponsividadeLayoutBuilder(),
    debugShowCheckedModeBanner: false,
  ));
}
