import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _existingChats = []; // Lista de IDs das pessoas com as quais já tenho mensagens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search by username...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            // Implemente a lógica de pesquisa aqui
          },
        ),
      ),
      body: Column(
        children: [
          // Lista de pessoas com as quais já tenho mensagens
          Expanded(
            child: ListView.builder(
              itemCount: _existingChats.length,
              itemBuilder: (context, index) {
                String userId = _existingChats[index];
                return ListTile(
                  title: Text(userId), // Substitua pelo nome de usuário se você tiver essa informação
                  onTap: () {
                    // Navegue para a tela de chat com o usuário selecionado
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen(userId)),
                    );
                  },
                );
              },
            ),
          ),
          // Outras seções ou widgets conforme necessário
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String userId;

  ChatScreen(this.userId);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userId), // Substitua pelo nome de usuário se você tiver essa informação
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chats/${widget.userId}/messages')
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
                    controller: _messageController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(labelText: 'Send a message...'),
                    onChanged: (value) {
                      setState(() {
                        _message = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Theme.of(context).primaryColor,
                  onPressed: _message.trim().isEmpty ? null : _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    // Implemente a lógica para enviar a mensagem
  }
}
