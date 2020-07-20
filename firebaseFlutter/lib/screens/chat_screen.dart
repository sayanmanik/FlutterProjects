import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseFlutter/widgets/chat/messages.dart';
import 'package:firebaseFlutter/widgets/chat/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlutterChat'), actions: [
        DropdownButton(
          icon: Icon(Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color),
          items: [
            DropdownMenuItem(
              child: Container(
                  child: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 8),
                  Text('Logout')
                ],
              )),
              value: 'logout',
            )
          ],
          onChanged: (itemIdentifier) {
            if (itemIdentifier == 'logout') {
              FirebaseAuth.instance.signOut();
            }
          },
        )
      ]),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Messages()
            ), 
          NewMessages()
        ],
      )),
    );
  }
}
