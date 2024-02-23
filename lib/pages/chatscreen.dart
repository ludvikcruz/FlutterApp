import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Se você for usar SVGs

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  String _enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance.collection('chats/YOUR_CHAT_ID/messages').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('chats/YOUR_CHAT_ID/messages')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
                  if (chatSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final chatDocs = chatSnapshot.data!.docs;
                  return ListView.builder(
                    reverse: true,
                    itemCount: chatDocs.length,
                    itemBuilder: (ctx, index) => ListTile(
                      title: Text(chatDocs[index]['text']),
                      // Personalize aqui conforme necessário
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(labelText: 'Send a message...'),
                      onChanged: (value) {
                        setState(() {
                          _enteredMessage = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    color: Theme.of(context).primaryColor,
                    onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
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
