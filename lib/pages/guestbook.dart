import 'package:flutter/material.dart';

class GuestbookPage extends StatefulWidget {
  @override
  _GuestbookPage createState() => _GuestbookPage();
}

class _GuestbookPage extends State<GuestbookPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestabók'),
      ),
      body: Center(
        child: Text('Þetta er skjár fyrir Gestabók'),
      ),
    );
  }
}