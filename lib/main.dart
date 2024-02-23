import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/pages/inicial.dart';
import 'firebase_options.dart';
// Certifique-se de que este arquivo contém sua classe LoginScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: SplashPage()
     
    );
  }
}