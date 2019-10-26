import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class GuestbookPage extends StatefulWidget {
  @override
  _GuestbookPage createState() => _GuestbookPage();
}

class _GuestbookPage extends State<GuestbookPage> {
  // VISIT
  Widget _renderVisitTile(DocumentSnapshot document) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 55, 144, 191),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Container(
          margin: EdgeInsets.all(15),
          child: Text(
            document['message'],
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 16,
              fontFamily: "Helvetica",
            ),
          ),
        ),
      ),
    );
  }

  // render a tile
  Widget _renderMessageTile(DocumentSnapshot document, bool fromMe) {
    return Align(
      alignment: fromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          color: fromMe
              ? Color.fromARGB(255, 233, 234, 234)
              : Color.fromARGB(255, 215, 242, 255),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Container(
          margin: EdgeInsets.all(15),
          child: Text(
            document['message'],
            style: TextStyle(
              color: Color.fromARGB(255, 68, 67, 67),
              fontSize: 16,
              fontFamily: "Helvetica",
            ),
          ),
        ),
      ),
    );
  }

  // render a tile
  Widget _renderTile(DocumentSnapshot document) {
    // Check if this is a visit
    if (document['isVisit'] == true) {
      return _renderVisitTile(document);
    }

    return _renderMessageTile(document, true);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('guestbookMessages')
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
                  return new ListView(
                    children: snapshot.data.documents.map((d) {
                      var d2 = d;
                      return _renderTile(d2);
                    }).toList(),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
