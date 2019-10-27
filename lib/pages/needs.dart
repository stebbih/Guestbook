import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:guestbook/constants.dart';

class NeedsPage extends StatefulWidget {
  /* @override
  State<StatefulWidget> createState() {
    return new _NeedsPage();
  }
  */
  @override
  _NeedsPage createState() => _NeedsPage();
}

class _NeedsPage extends State<NeedsPage> {
  final _formKey = GlobalKey<FormState>();
  String user;
  Map<String, dynamic> needs = new Map<String, dynamic>();
  int priority = 3;

  void postNeed(String task, int priority) {
    if (task == '' || task == null) {
      return;
    }

    Firestore.instance.collection('needs').document().setData({
      'reporter': USER_NAME,
      'priority': priority,
      'doer': null,
      'task': task
    });
  }

  int _radioValue = 0;
  int value = 0;

  _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return new AlertDialog(
              title: Text("Make new task"),
              content: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          onSaved: (String v) {
                            postNeed(v, priority);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Radio(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: (val) {
                                setState(() {
                                  _radioValue = val;
                                  priority = val;
                                });
                              },
                            ),
                            new Text('High'),
                            new Radio(
                              value: 2,
                              groupValue: _radioValue,
                              onChanged: (val) {
                                setState(() {
                                  _radioValue = val;
                                  priority = val;
                                });
                              },
                            ),
                            new Text('Medium'),
                            new Radio(
                              value: 3,
                              groupValue: _radioValue,
                              onChanged: (val) {
                                setState(() {
                                  _radioValue = val;
                                  priority = val;
                                });
                              },
                            ),
                            new Text('Low')
                          ]),
                    ],
                  ),
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
                  child: Text("Add"),
                ),
              ]);
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          Expanded(
              child: new ListView.builder(
            itemCount: needs.length == null ? 0 : needs.length,
            itemBuilder: (context, index) {
              String need = needs.keys.elementAt(index);
              return new Card(
                  child: ListTile(
                      leading: new Checkbox(
                        value: needs[need]['doer'] == '' ? false : true,
                        onChanged: (v) {
                          setState(() {
                            if (needs[need]['doer'] == '') {
                              needs[need]['doer'] = 'Me';
                            } else {
                              needs[need]['doer'] = '';
                            }
                          });
                        },
                      ),
                      title: new Text(need.toString())));
            },
          )),
        ]),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: () => _displayDialog(context)));
  }
}
