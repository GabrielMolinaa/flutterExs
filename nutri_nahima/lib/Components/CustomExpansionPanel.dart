import 'package:flutter/material.dart';
import 'Card.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomExpansionPanelList extends StatelessWidget {
  final List<bool> isOpenList;
  final List<String> headerTitles;
  final List<String> panelTitles;

  final Function(int, bool) expansionCallback;

  CustomExpansionPanelList({
    required this.isOpenList,
    required this.headerTitles,
    required this.panelTitles,
    required this.expansionCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ExpansionPanelList(
        materialGapSize: 20,
        expansionCallback: expansionCallback,
        children: List.generate(headerTitles.length, (index) {
          return ExpansionPanel(
            isExpanded: isOpenList[index],
            canTapOnHeader: true,
            headerBuilder: (context, isOpen) {
              return Padding(
                padding: EdgeInsets.all(10),

                child: ListTile(
                  title: Text(headerTitles[index],
                    style: GoogleFonts.ubuntu(
                      fontSize: 18,
                      color: Color.fromARGB(200, 34, 139, 34),
                      fontWeight: FontWeight.bold,
                    ),),
                  leading: CircleAvatar(child: Icon(Icons.fastfood, color: Colors.white),backgroundColor: Colors.green),
                ),
              );
            },
            body: ElevatedCardExample(
              titulo: panelTitles[index],
              tipo: panelTitles[index].toLowerCase(),
            ),
          );
        }),
      ),
    );
  }
}