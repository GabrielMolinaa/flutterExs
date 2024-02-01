import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chuva Alerta",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: Colors.white,
              fontWeight: FontWeight.w400
            )
          ),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color(0xffffffff),
          size: 18,
        ),
      ),

      body: Align(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
              ),
              height: 90,
            )
          ],

        ),
      )
    );
  }
}
