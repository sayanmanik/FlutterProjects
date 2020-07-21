import 'package:firebaseFlutter/widgets/chat/messages.dart';
import 'package:firebaseFlutter/widgets/chat/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  @override
  void initState(){
    super.initState();
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage: (msg){
      print('on Message');
      print(msg);
      return;
    },onLaunch: (msg) {
      print('on Launch');
      print(msg);
      return;
    },onResume: (msg) {
      print(' on Resume');
      print(msg);
      return;
    });
    fbm.subscribeToTopic('chat');
    
  }

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

