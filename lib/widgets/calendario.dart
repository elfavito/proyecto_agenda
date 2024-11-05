import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List> _events = {
    DateTime(2023, 4, 16): ['Turno 1'],
    DateTime(2023, 4, 17): ['Turno 2', 'Turno 3'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendario de Turnos')),
      body: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime(2023, 1),
        lastDay: DateTime(2026, 12),
        calendarFormat: _calendarFormat,
        rowHeight: 40,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        // events: _events, // Corrected parameter name
      ),
    );
  }
}
