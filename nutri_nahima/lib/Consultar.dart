import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

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

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
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
                itemCount: 16, // 16 slots for 10:00 AM to 6:00 PM with 30-min intervals
                itemBuilder: (context, index) {
                  int hour = index ~/ 2 + 10;
                  int minute = (index % 2) * 30;
                  return CheckboxListTile(
                    title: Text('${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}'),
                    value: _horariosSelecionados.contains(DateTime(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day, hour, minute)),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null && value) {
                          _horariosSelecionados.add(DateTime(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day, hour, minute));
                        } else {
                          _horariosSelecionados.remove(DateTime(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day, hour, minute));
                        }
                      });
                    },
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<DateTime> _horariosSelecionados = [];
}
