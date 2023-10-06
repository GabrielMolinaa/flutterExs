
import 'package:flutter/material.dart';
import 'package:tela_login/TelaAplicativo.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  String usuario = "gabriolo";
  String senha  = "1234";
  TextEditingController campoUsuario = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  bool verSenha = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: campoUsuario,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite o nome de usuário",
              ),
            ),
            TextField(
              controller: campoSenha,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite a senha",

              ),
              onTap: (){
                setState(() {
                  verSenha = !verSenha;
                });
              },
              obscureText: verSenha,
            ),
            Padding(
              padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                      onPressed: (){
                        if(campoSenha.text == senha && campoUsuario.text == usuario){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaAplicativo(),
                              ),
                          );
                          campoSenha.clear();
                          campoUsuario.clear();
                        }else {
                          if (campoUsuario.text != usuario) {
                            campoUsuario.clear();
                          }
                          campoSenha.clear();
                        }
                      },
                      child: Text("Login"),)
            )
          ],
        ),
      ),
    );
  }
}
