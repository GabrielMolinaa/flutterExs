import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_aula/Tela2.dart';

class Tela1 extends StatefulWidget {
  const Tela1({super.key});


  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {

  TextEditingController campoUsuario = TextEditingController();
  TextEditingController campoSenha = TextEditingController();

  salvarDados(String usuario, String senha) async {
    print("salvando dados");
    final pref = await SharedPreferences.getInstance();
    await pref.setString('usuario', usuario);
    await pref.setString('senha', senha);
  }

  lerDados() async {
    print("Lendo Dados");
    final pref = await SharedPreferences.getInstance();
    String usuario = pref.getString('usuario') ?? "ERRO";
    String senha = pref.getString('senha') ?? "ERRO";
    if(usuario == 'admin' && senha == '123'){
      Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => Tela2(usuario,senha)
      )
      );
    }
  }

  excluirDados() async{
    final pref = await SharedPreferences.getInstance();
    await pref.remove("usuario");
    await pref.remove('senha');
  }

  @override
  Widget build(BuildContext context) {
    //salvarDados();
    lerDados();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 1 Shared Preferences")
      ),

      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Usuario",
              ),
              controller: campoUsuario,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Senha",
              ),
              controller: campoSenha,
            ),
            
            ElevatedButton(
                onPressed: (){
                  salvarDados(campoUsuario.text, campoSenha.text);
                  if(campoUsuario.text == 'admin' && campoSenha.text == '123') {
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => Tela2(campoUsuario.text,campoSenha.text)
                    )
                    );
                  }
                },
                child: Text("LOGAR"),
            ),
          ],
        ),
      ),
    );
  }
}
