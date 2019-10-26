import 'package:flutter/material.dart';

import 'package:guestbook/pages/home.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RootPage();
}

class _RootPage extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
