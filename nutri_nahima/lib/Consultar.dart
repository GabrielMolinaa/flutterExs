import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:nutri_nahima/ConsultarAgenda.dart';
import 'package:intl/intl.dart';
import 'Home.dart';

class Consultar extends StatefulWidget {
  const Consultar({Key? key});

  @override
  _ConsultarState createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  late Future<Map<int, List<String>>> _horariosAgendadosFuture;
  List<String> _horariosDisponiveis = [];

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _horariosAgendadosFuture = consultarAgenda();
    _horariosAgendadosFuture.then((value) {
      List<String> horariosAgendados = value.values.expand((i) => i).toList();
      List<String> horariosCompletos = [];
      print(horariosAgendados);

      for (int hour = 10; hour < 18; hour++) {
        for (int minute = 0; minute < 60; minute += 30) {
          String formattedTime = '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
          if (!horariosAgendados.contains(formattedTime)) {
            horariosCompletos.add(formattedTime);
          }
        }
      }

      setState(() {
        _horariosDisponiveis = horariosCompletos;
      });
    });
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;

        _horariosAgendadosFuture = consultarAgenda();
        _horariosAgendadosFuture.then((value) {
          List<String> horariosAgendados = value[selectedDay.day] ?? [];
          List<String> horariosCompletos = [];

          for (int hour = 10; hour < 18; hour++) {
            for (int minute = 0; minute < 60; minute += 30) {
              String formattedTime = '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
              if (!horariosAgendados.contains(formattedTime)) {
                horariosCompletos.add(formattedTime);
              }
            }
          }

          setState(() {
            _horariosDisponiveis = horariosCompletos;
          });
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2021, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              headerVisible: true,
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.w800),
              ),
              calendarStyle: CalendarStyle(
                todayTextStyle: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightGreen,
                ),
              ),
              calendarFormat: _calendarFormat,
              rangeSelectionMode: _rangeSelectionMode,
              onDaySelected: _onDaySelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            if (_selectedDay != null) ...[
              SizedBox(height: 20),
              Text(
                'Horários Disponíveis para ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _horariosDisponiveis.length,
                itemBuilder: (context, index) {
                  String horarioDisponivel = _horariosDisponiveis[index];

                  return CheckboxListTile(
                    title: Text(horarioDisponivel),
                    value: _horariosSelecionados.contains(horarioDisponivel),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null && value) {
                          _horariosSelecionados.add(horarioDisponivel);
                        } else {
                          _horariosSelecionados.remove(horarioDisponivel);
                        }
                      });
                    },
                  );
                },
              ),
            ],
            ElevatedButton(
              onPressed: () {
                if (_selectedDay != null && _horariosSelecionados.isNotEmpty) {
                  String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDay!);

                  for (String horario in _horariosSelecionados) {
                    String hora = horario.substring(0, 2);
                    String minuto = horario.substring(3);
                    DateTime dateTime = DateTime(
                      _selectedDay!.year,
                      _selectedDay!.month,
                      _selectedDay!.day,
                      int.parse(hora),
                      int.parse(minuto),
                    );

                    String nome = getNo;
                    adicionarConsulta(dateTime, nome);
                  }
                }
              },
              child: Text('Agendar'),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _horariosSelecionados = [];
}
