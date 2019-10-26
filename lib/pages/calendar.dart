import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPage createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Á Döfinni'),
      ),
      body: Center(
        child: Text('Þetta er skjár fyrir Á Döfinni'),
      ),
    );
  }
}