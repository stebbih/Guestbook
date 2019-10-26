import 'package:flutter/material.dart';

import 'package:guestbook/root.dart';

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