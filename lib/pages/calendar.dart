import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPage createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  final _formKey = GlobalKey<FormState>();
  List<String> _commentList = [];
  DateTime _date;

  Widget calendarList(int index) {
    return Card(
      child: ListTile(
        leading: Text('nafn'),
        title: Text(_commentList[index]),
        subtitle: Text('Timi hér'),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }

  void addCommentToList(String _comment) {
    Firestore.instance
        .collection('events')
        .document()
        .setData({'title': _comment, 'timeStamp': Timestamp.fromDate(_date), 'user': 'Stefán'});
  }

  String formatTimestamp(int timestamp) {
      var format = new DateFormat('d MMM, hh:mm a');
      var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      print(format.format(date));
      return format.format(date);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Á Döfinni'),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('events').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
                return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    DateTime fromTimeStamp = document['timeStamp'].toDate();
                    var formatedDate =
                        new DateFormat.MMMd().format(fromTimeStamp);
                    var formatTime =
                        new DateFormat.Hm().format(fromTimeStamp);
                    return new Card(
                      color: document['user'] == 'Stefán'
                          ? Color.fromARGB(255, 55, 144, 191)
                          : Color.fromARGB(255, 215, 242, 255),
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.userAlt),
                        title: new Text(
                          document['title'],
                          style: TextStyle(
                            color: document['user'] == 'Stefán'
                                ? Color.fromARGB(255, 255, 255, 255)
                                : Color.fromARGB(255, 68, 67, 67),
                            fontSize: 18,
                            fontFamily: "Helvetica",
                          ),
                        ),
                        subtitle: new Text(
                          '$formatedDate - $formatTime',
                          style: TextStyle(
                            color: document['user'] == 'Stefán'
                                ? Color.fromARGB(255, 255, 255, 255)
                                : Color.fromARGB(255, 68, 67, 67),
                            fontSize: 14,
                            fontFamily: "Helvetica",
                          ),
                        ),
                        trailing: Icon(Icons.more_vert),
                      ),
                    );
                  }).toList(),
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text("Skrá viðburð"),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              FlatButton(
                                child: Icon(FontAwesomeIcons.calendarAlt),
                                onPressed: () {
                                  DatePicker.showDateTimePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime.now(),
                                      maxTime: DateTime(2020, 10, 27),
                                      onConfirm: (date) {
                                    print(date);
                                    _date = date;
                                    setState(() {});
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                              ),
                              Text('$_date'),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              onSaved: (String value) {
                                addCommentToList(value);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                      FlatButton(
                        onPressed: () {
                          _formKey.currentState.save();
                        },
                        child: Text("Change"),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
        tooltip: 'Skrá viðburð',
        child: const Icon(Icons.add),
      ),
    );
  }
}
