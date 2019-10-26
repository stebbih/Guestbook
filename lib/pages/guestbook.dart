import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:guestbook/constants.dart';

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
        margin: EdgeInsets.only(top: 1),
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
  Widget _renderTile(DocumentSnapshot document, isMe) {
    // Check if this is a visit
    if (document['isVisit'] == true) {
      return _renderVisitTile(document);
    }

    return _renderMessageTile(document, isMe);
  }

  List<Widget> _renderList(List<DocumentSnapshot> messages) {
    List<Widget> chatList = new List<Widget>();

    String lastUser;
    DateTime lastDate;
    messages.forEach((message) {
      String messageUser = message['user'];
      DateTime messageDate = message['timestamp'].toDate();

      // Is this me?
      bool isMe = false;
      if (messageUser == USER_NAME) {
        isMe = true;
      }

      // Is this the first message / first message of day ?
      if (lastDate == null || lastDate.difference(messageDate).inDays > 0) {
        //chatList.add(_renderDate(messageDate));
        chatList.add(_renderUser(messageUser, isMe));
      } else if (messageUser != lastUser) {
        // Is new user
        chatList.add(_renderUser(messageUser, isMe));
      }

      // render message
      chatList.add(_renderTile(message, isMe));

      lastDate = messageDate;
      lastUser = messageUser;
    });
    return chatList;
  }

/*
  Widget _renderDate(DateTime date) {
    return Container(
      child: Text(
        date.toLocal(),
        style: TextStyle(
          color: Color.fromARGB(255, 166, 166, 166),
          fontSize: 12,
          fontFamily: "Helvetica",
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
*/
  Widget _renderUser(String user, bool fromMe) {
    return Container(
      margin: EdgeInsets.only(top: 4, right: 8, left: 5),
      child: Text(
        user,
        textAlign: fromMe ? TextAlign.right : TextAlign.left,
        style: TextStyle(
          color: Color.fromARGB(255, 166, 166, 166),
          fontSize: 14,
          fontFamily: "Helvetica",
        ),
      ),
    );
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
                  return ListView(
                      children: _renderList(snapshot.data.documents));
              }
            },
          ),
        ),
      ),
    );
  }
}
