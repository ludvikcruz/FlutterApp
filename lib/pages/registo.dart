import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/pages/auth.dart';
import 'package:test_drive/pages/login.dart';

class RegisterPage extends StatefulWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();



  void _register(BuildContext context) async {
    User? user = await _authService.registerWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );
    
    if (user != null) {
      // Registro bem-sucedido, navegue para a próxima tela ou mostre sucesso
      // Substitua 'YourHomeScreen()' pelo nome da tela para a qual você deseja navegar após o registro bem-sucedido
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      // Falha no registro, mostre uma mensagem de erro
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro no registro'),
          content: Text('Não foi possível registrar. Por favor, tente novamente.'),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

}

class _RegisterPageState extends State<RegisterPage> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              hint: Text('Select Gender'),
              onChanged: (newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text('Registrar'),
            ),
            TextButton(
              child: Text('Already have an account? Login'),
              onPressed: () {
                // Substitua 'YourLoginScreen()' pelo nome da sua tela de login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
