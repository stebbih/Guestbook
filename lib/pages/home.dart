import 'package:flutter/material.dart';

import 'package:guestbook/pages/calendar.dart';
import 'package:guestbook/pages/chat.dart';
import 'package:guestbook/pages/needs.dart';
import 'package:guestbook/pages/guestbook.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//the main bottom navigaton selections
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    new GuestbookPage(),
    new ChatPage(),
    new CalendarPage(),
    new NeedsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 28,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Guestbook'),
            activeIcon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            title: Text('Chat'),
            activeIcon: Icon(FontAwesomeIcons.comment),
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendarAlt),
              title: Text('Comming up'),
              activeIcon: Icon(FontAwesomeIcons.calendarAlt)),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.listAlt),
            title: Text('Needs'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  //changes index on screen display when bottom navigation is pressed
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
