import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Receita extends StatelessWidget {
  final Map<String, dynamic> receita;

  Receita({required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: false,
            backgroundColor: Colors.green,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                child: Image.asset(
                  receita['caminho'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${receita['id']}",
                    style: GoogleFonts.cabin(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    receita['calorias'].toString() + " kcal por porção",
                    style: GoogleFonts.ptSans(
                      height: 1.3,

                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Ingredientes:',
                    style: TextStyle(
                      fontSize: 18,
                      height: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (receita['ingredientes'] as Map<String, dynamic>).entries.map((entry) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Icon(Icons.arrow_forward_ios_rounded, size: 12,color: Colors.black87),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              '${entry.value};\n',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.ptSans(
                                fontSize: 17,
                                height: 1,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  Divider(
                    height: 5,
                    color: Colors.black26,
                    thickness: 1,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Modo de Preparo:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (receita['modo de preparo'] as Map<String, dynamic>).entries.map((entry) {
                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${entry.key}. ${entry.value}\n',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.ptSans(
                                height: 1.3,

                                fontSize: 17,
                                color: Colors.black87,
                              ),
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 2.0),
                  Divider(
                    height: 5,
                    color: Colors.black26,
                    thickness: 1,
                  ),
                  SizedBox(height: 16.0),

                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
