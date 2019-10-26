import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guestbook/constants.dart';

class GuestbookPage extends StatefulWidget {
  @override
  _GuestbookPage createState() => _GuestbookPage();
}

class _GuestbookPage extends State<GuestbookPage> {
/*  Firestore firestore;
  bool gotData = false;
  Query messages;

  void initState() {
    super.initState();
    firestore = Firestore.instance;
    Query query = Firestore.instance.collection('groups');
    // .where("id", isEqualTo: OUR_GROUP_ID);

    query
        .snapshots()
        .listen((data) => data.documents.forEach((doc) => print(doc["title"])));
    getGroup();
  }

  // Get trips that user has marked
  // and trips made by user
  Future<void> getGroup() async {
    setState(() {
      gotData = true;
      // messages = m;
    });
  }
  Stream<QearySnapshot> group  Firestore.instance.collection('books').snapshots()

  void initState() {

  }
  */

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('groups').snapshots(),
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
                      title: new Text(document['groupName']),
                      subtitle: new Text("hæ"),
                    );
                  }).toList(),
                );
            }
          },
        ),
      ),
    );
  }
}
