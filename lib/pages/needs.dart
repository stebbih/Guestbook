import 'package:flutter/material.dart';

class NeedsPage extends StatefulWidget {
  @override
  _NeedsPage createState() => _NeedsPage();
}

class _NeedsPage extends State<NeedsPage> {
  final _formKey = GlobalKey<FormState>();
  String user;
  Map<String, bool> needs = new Map<String, bool>();

  void addNeed(String value) {
    if (value != '') {
      setState(() => needs[value] = false);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
            child: new ListView.builder(
          itemCount: needs.length == null ? 0 : needs.length,
          itemBuilder: (context, index) {
            String value = needs.keys.elementAt(index);
            return new Card(
                child: ListTile(
                    leading: new Checkbox(
                      value: needs[value],
                      onChanged: (v) {
                        setState(() {
                          needs[value] = !needs[value];
                        });
                      },
                    ),
                    title: new Text(value)));
          },
        )),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                        title: Text("Make new task"),
                        content: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  onSaved: (String value) {
                                    addNeed(value);
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
                            child: Text("Add"),
                          ),
                        ]);
                  },
                );
              });
        },
      ),
    );
  }
}
