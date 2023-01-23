import 'package:flutter/material.dart';
import 'package:comchart/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late Firebase loggedInUser;
  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final User? user = await _auth.currentUser;
      //  final uid = user?.email;
      //  print(uid);
    } catch (e) {
      print(e);
    }
  }
  // Future<void> getMessages () async {
  //  final messages = await _firestore.collection('messages').get();
  //  for (var message in messages.docs) {
  //    print(message.data());
  //  }
  // }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // getMessages();
                messagesStream();
                //  _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  List<MessageCub> messageCubs = [];
                  if (snapshot.hasData) {
                    final messages = snapshot.data?.docs;
                    for (var message in messages!) {
                      final messageText =
                          message.data()['text']; // this a firebase data
                      final messageSender = message.data()['sender'];
                      final messageCub = MessageCub(
                        text: messageText,
                        sender: messageSender,
                      );

                      messageCubs.add(messageCub);
                    } //for
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightGreen,
                      ),
                    );
                  } //if
                  return Expanded(
                    child: ListView(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        children: messageCubs),
                  );
                } //builder
                ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': _auth.currentUser?.email, // это поменять?
                            });
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageCub extends StatelessWidget {
  //const MessageCub({Key? key}) : super(key: key);  -создалось автоматом

  MessageCub({required this.text, required this.sender});
  final String? sender;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        color: Colors.lightBlueAccent,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Text('$text from $sender',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15.0,
              )),
        ),
      ),
    );
  }
}
