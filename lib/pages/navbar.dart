import 'package:flutter/material.dart';
import 'package:test_drive/pages/home.dart';
import 'package:test_drive/pages/perfil.dart';
import 'package:test_drive/pages/settings.dart';
import 'package:test_drive/models/category_model.dart';

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  // Lista de páginas disponíveis
  List<Widget> _pages = [
    HomePage(), // Página inicial
    ProfilePage(), // Página de perfil
    SettingsPage(), // Página de configurações
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // Função chamada quando um item da barra de navegação é selecionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
