import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:guestbook/constants.dart';

class GuestbookPage extends StatefulWidget {
  @override
  _GuestbookPage createState() => _GuestbookPage();
}

class _GuestbookPage extends State<GuestbookPage> {
  DateFormat dateFormat = DateFormat("MMM dd");

  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  // VISIT
  Widget _renderVisitTile(DocumentSnapshot document, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
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
            textAlign: isMe ? TextAlign.right : TextAlign.left,
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
      if (lastDate == null || messageDate.difference(lastDate).inDays > 0) {
        chatList.add(_renderDate(messageDate));
        chatList.add(_renderUser(messageUser, isMe));
      } else if (messageUser != lastUser) {
        // Is new user
        chatList.add(_renderUser(messageUser, isMe));
      }

      // render message
      chatList.add(_renderVisitTile(message, isMe));

      lastDate = messageDate;
      lastUser = messageUser;
    });
    return chatList;
  }

  Widget _renderDate(DateTime date) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Text(
        dateFormat.format(date),
        style: TextStyle(
          color: Color.fromARGB(255, 166, 166, 166),
          fontSize: 14,
          fontFamily: "Helvetica",
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _renderUser(String user, bool fromMe) {
    return Container(
      margin: EdgeInsets.only(top: 2, right: 8, left: 5),
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

  void postMessage(String message) {
    Firestore.instance.collection('guestbookMessages').document().setData({
      'isVisit': true,
      'timestamp': Timestamp.now(),
      'user': USER_NAME,
      'message': message
    });
  }

  Widget _renderBottomBar() {
    return new TextField(
      controller: myController,
      autofocus: false,
      onSubmitted: (value) {
        postMessage(value);
        myController.clear();
      },
      decoration: new InputDecoration(
        hintText: "Sign guestbook...",
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(9.0)),
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection('guestbookMessages')
                        .orderBy('timestamp')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
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
                _renderBottomBar()
              ],
            )),
      ),
    );
  }
}
