
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController campoUser = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {



    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),

      body:Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
         //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Image.asset(
                    "images/nutri.png", width: 100,
                  ),

                ]
            ),
            SizedBox(
              height: 70,
            ),
            TextField(
              controller: campoUser,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color: Color(0xFF006400),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1, color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1, color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: campoSenha,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Color(0xFF006400),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1, color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1, color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),

              ),

            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF269B26),
              ),
                onPressed: (){
                if(campoUser.text.isEmpty || campoSenha.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Preencha campos corretamente!"), backgroundColor: Colors.red,));
                }
                  login(campoUser.text,campoSenha.text);
                },
                child: Text("Login"),

            ),
          ],
        ),
      )
    );
  }

  login(username, senha) async{
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: Colors.green),
              SizedBox(width: 20),
              Text("Fazendo login..."),
            ],
          ),
        );
      },
    );
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    senha = senha.trim();
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: username, password: senha);

      if(userCredential != null){
        CircularProgressIndicator(color: Colors.green);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Home())
        );
      }
    }on FirebaseAuthException catch(e){
      Navigator.pop(context); // Fecha o diálogo de carregamento
      if(e.code == 'INVALID_LOGIN_CREDENTIALS'){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Credenciais Inválidas!"),
                backgroundColor: Colors.red,
            )
        );
      }
      if(e.code == 'invalid-email'){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Formato de Email Inválido!"),
              backgroundColor: Colors.red,
            )
        );
      }
      print( "========>"+e.code);

    }
  }

}

