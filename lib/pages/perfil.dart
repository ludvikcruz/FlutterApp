import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navegar para a página de edição de perfil
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Executar ação de logout
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('URL_DA_IMAGEM_AQUI'),
              // Substitua 'URL_DA_IMAGEM_AQUI' pelo link da imagem de perfil
            ),
          ),
          Text(
            "Nome do Usuário",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              // Substitua este ListView por sua lista de amigos ou outras informações
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Amigo 1'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Amigo 2'),
                ),
                // Adicione mais amigos ou informações aqui
              ],
            ),
          ),
        ],
      ),
    );
  }
}
