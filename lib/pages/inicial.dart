import 'package:flutter/material.dart';
import 'package:test_drive/pages/login.dart'; // Assegure-se de importar a página de login corretamente

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()), // Substitua `LoginPage` pelo widget da sua página de login
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/icons/logo.png'), // Substitua 'assets/logo.png' pelo caminho correto do seu logo
      ),
    );
  }
}
