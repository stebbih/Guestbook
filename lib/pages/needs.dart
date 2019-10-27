import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:guestbook/constants.dart';

class NeedsPage extends StatefulWidget {
  @override
  _NeedsPage createState() => _NeedsPage();
}

class _NeedsPage extends State<NeedsPage> {
  final _formKey = GlobalKey<FormState>();
  int priority = 3;

  void postNeed(String task, int priority) {
    if (task == '' || task == null) {
      return;
    }

    Firestore.instance.collection('needs').document().setData({
      'reporter': USER_NAME,
      'priority': priority,
      'doer': null,
      'task': task,
      'timestamp': Timestamp.now(),
    });
  }

  void patchNeed(DocumentSnapshot need, String user) {
    debugPrint('hey');
    Firestore.instance
        .collection('needs')
        .document(need.documentID)
        .updateData({'doer': user}).catchError((e) {
      print(e);
    });
  }

  Widget _renderList(List<DocumentSnapshot> needs) {
    List<Widget> list = [];
    debugPrint(needs.length.toString());
    needs.forEach((need) {
      list.add(
        ListTile(
          leading: new Checkbox(
            value: need['doer'] == null || need['doer'] == '' ? false : true,
            onChanged: (v) {
              if (need['doer'] == null || need['doer'] == '') {
                patchNeed(need, USER_NAME);
              } else {
                patchNeed(need, null);
              }
            },
          ),
          title: new Text(need['task']),
        ),
      );
    });

    return ListView(
      children: list,
    );
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
              content: Container(
                height: 200,
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
        body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('needs')
                .orderBy('timestamp')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return _renderList(snapshot.data.documents);
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: () => _displayDialog(context)));
  }
}
