import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'login.dart'; // Verifique se o caminho está correto
import 'auth.dart'; // Verifique se o caminho está correto

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String? _selectedGender;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register(BuildContext context) async {
    User? user = await _authService.registerWithEmailAndPassword(
      _emailController.text,
      _passwordController.text,
    );

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro no registro'),
          content: Text('Não foi possível registrar. Por favor, tente novamente.'),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/voltar.svg'), // Ícone personalizado de voltar
          onPressed: () => Navigator.of(context).pop(), // Ação para voltar para a tela anterior
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Campos de texto para email, senha e dropdown para sexo
            TextFormField(
              // controller: _emailController,
              decoration: InputDecoration(labelText: 'First Name'),
              keyboardType: TextInputType.firstname,
            ),
            TextFormField(
              // controller: _emailController,
              decoration: InputDecoration(labelText: 'Last Name'),
              keyboardType: TextInputType.lastname,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              decoration: InputDecoration(
                labelText: 'Select Gender',
                // Adiciona o ícone ao lado direito do dropdown
                suffixIcon: Padding(
                  padding: EdgeInsets.all(0),
                  child: SvgPicture.asset('assets/icons/seta-direita.svg', width: 24, height: 24),
                ),
              ),
              onChanged: (newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
              items: <String>['Male', 'Female']
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
              child: Text('Register'),
            ),
            TextButton(
              child: Text('Already have an account? Login'),
              onPressed: () {
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
