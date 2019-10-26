import 'package:flutter/material.dart';

class NeedsPage extends StatefulWidget {
  @override
  _NeedsPage createState() => _NeedsPage();
}

class _NeedsPage extends State<NeedsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vantar'),
      ),
      body: Center(
        child: Text('Þetta er skjár fyrir Vantar'),
      ),
    );
  }
}