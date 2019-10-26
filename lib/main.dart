import 'package:flutter/material.dart';

import 'package:guestbook/root.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => RootPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
