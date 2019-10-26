import 'package:flutter/material.dart';

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
  String _date = '';

  Widget calendarList(int index) {
    return Card(
      child: ListTile(
        leading: Text('nafn'),
        title: Text(_commentList[index]),
        subtitle: Text(_date),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }

  void addCommentToList(String _comment) {
    /*setState(() {
      _commentList.add(_comment);
    });*/
    Firestore.instance.collection('events').document()
  .setData({ 'title': _comment, 'date': _date, 'user': 'Stefán'});
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
                    return new ListTile(
                      title: new Text(document['title']),
                      subtitle: new Text('date'),
                    );
                  }).toList(),
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _date = 'Select date';
          });
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
                                      minTime: DateTime(2018, 3, 5),
                                      maxTime: DateTime(2019, 6, 7),
                                      onConfirm: (date) {
                                    print(date);
                                    _date =
                                        '${date.day}/${date.month} - ${date.hour}:${date.minute}';
                                    setState(() {});
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                              ),
                              Text(_date),
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
