import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Notificações"),
            subtitle: Text("Novas mensagens, curtidas, e mais"),
            leading: Icon(Icons.notifications),
            onTap: () {
              // Navegar para a página de configurações de notificação
            },
          ),
          ListTile(
            title: Text("Privacidade e Segurança"),
            subtitle: Text("Configurações de segurança da conta"),
            leading: Icon(Icons.lock),
            onTap: () {
              // Navegar para a página de configurações de privacidade e segurança
            },
          ),
          ListTile(
            title: Text("Conta"),
            subtitle: Text("Configurações da conta, como mudança de senha"),
            leading: Icon(Icons.person),
            onTap: () {
              // Navegar para a página de configurações da conta
            },
          ),
          ListTile(
            title: Text("Tema"),
            subtitle: Text("Claro, Escuro, ou Sistema"),
            leading: Icon(Icons.palette),
            onTap: () {
              // Navegar para a página de configurações de tema
            },
          ),
          ListTile(
            title: Text("Sobre"),
            subtitle: Text("Informações sobre o aplicativo"),
            leading: Icon(Icons.info),
            onTap: () {
              // Navegar para a página Sobre
            },
          ),
        ],
      ),
    );
  }
}





// onTap: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => PrivacySettingsPage()),
//   );
// },
