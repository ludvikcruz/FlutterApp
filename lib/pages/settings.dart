// Em settings_page.dart
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Center(
        child: Text("Aqui vão as configurações"),
      ),
    );
  }
}
