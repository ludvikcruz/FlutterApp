import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Itens da API'),
        ),
        body: ListaItens(),
      ),
    );
  }
}

class ListaItens extends StatefulWidget {
  @override
  _ListaItensState createState() => _ListaItensState();
}

class _ListaItensState extends State<ListaItens> {
  List _itens = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/itens'));
    if (response.statusCode == 200) {
      setState(() {
        _itens = json.decode(response.body)['itens'];
      });
    } else {
      throw Exception('Falha ao carregar dados da API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _itens.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_itens[index]['nome']),
        );
      },
    );
  }
}
