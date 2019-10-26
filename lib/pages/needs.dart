import 'dart:convert';

import 'package:flutter/material.dart';


class NeedsPage extends StatefulWidget {
   @override
  State<StatefulWidget> createState() {
    return new _NeedsPage();
  }
  
 /* @override
  _NeedsPage createState() => _NeedsPage();*/
}

class _NeedsPage extends State<NeedsPage> {
  final _formKey = GlobalKey<FormState>();
  String user;
  Map<dynamic, dynamic> needs = new Map<String, String>();
  int priority = 3;

  
  void addNeed(String value, int priority) async {
    //debugPrint(priority.toString());
    // todo add to firestore
    if (value != '') {
      var tmpPri = priority.toString();
      try {
      var jsonData = '{ "reporter": "Me", "priority": $tmpPri, "doer": "Stefán" }';
      var parsedJson = json.decode(jsonData);
      needs[value] = parsedJson;
      } catch(e) {
        print("error: $e");
      }
      
    }
  }

  int _radioValue = 0;
  int value = 0;
  
  
  _displayDialog(BuildContext context) async {
      return showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return new AlertDialog(
                  title: Text("Make new task"),
                  content:
                    Center(
                    child: Form(
                      key: _formKey,
                      child: Column( 
                      mainAxisSize: MainAxisSize.min,
                        children: <Widget>[                            
                          Padding(
                              padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    onSaved: (String v) {
                                      addNeed(v, priority);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget> [
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
                            ]
                          ),
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
                    ]
                  );
                });
              },
            );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vantar'),
      ),
      body: Column(
        children: <Widget>[
         Expanded (
           child: new ListView.builder(
            itemCount: needs.length == null ? 0 : needs.length,
            itemBuilder: (context, index) {
              String value = needs.keys.elementAt(index);
              return new  Card(
                  child: ListTile(
                    leading: new Checkbox(
                      value: needs['doer'] == '' ? false : true,
                      onChanged: (v) {
                        setState(() {
                          if (needs['doer'] == '') {
                            needs['doer'] = 'Me';
                          } else {
                            needs['doer'] = '';
                          }
                        });
                      },
                      ),
                    title: new Text(value)
                )
              );
            },
          )
        ),
        ]
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _displayDialog(context)
        )
      );
    }
     
}