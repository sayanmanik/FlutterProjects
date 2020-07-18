import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: Firestore.instance
                .collection('chats/RfZpUMl8LsF21xWn0Huf/messages')
                .snapshots(),
            builder: (ctx, streamSnapshot) {
              if (streamSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final documents = streamSnapshot.data.documents;
              return ListView.builder(
                itemCount: streamSnapshot.data.documents.length,
                itemBuilder: (ctx, index) => Container(
                  padding: EdgeInsets.all(8),
                  child: Text(documents[index]['text']),
                  //child: Text('Hello'),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Firestore.instance
              .collection('chats/RfZpUMl8LsF21xWn0Huf/messages')
              .add({'text':'added new data on button click'});
            }
            )
          );
  }
}
