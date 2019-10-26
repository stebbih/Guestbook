import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPage createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spjall'),
      ),
      body: Center(
        child: Text('Þetta er skjár fyrir Spjall'),
      ),
    );
  }
}