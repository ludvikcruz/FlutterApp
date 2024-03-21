import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_drive/models/category_model.dart';
import 'package:test_drive/models/diet_model.dart';
import 'package:test_drive/models/popular_model.dart';
import 'package:test_drive/pages/chatscreen.dart';
// Importe suas outras páginas conforme necessário

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Lista das páginas para navegação
  final List<Widget> _pages = [
    ChatScreen(), // Página de exemplo, substitua conforme necessário
    // Adicione suas outras páginas aqui, como ProfilePage e SettingsPage
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Preparação das informações iniciais
    final List<CategoryModel> categories = CategoryModel.getCategories();
    final List<DietModel> diets = DietModel.getDiets();
    final List<PopularDietsModel> popularDiets = PopularDietsModel.getPopularDiets();

    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView( // Modificado para acomodar conteúdos extensos
        child: Column(
          children: [
            _searchField(),
            // const SizedBox(height: 40),
            // _categoriesSection(categories),
            // const SizedBox(height: 40),
            // _dietSection(diets),
            // const SizedBox(height: 40),
            // _popularSection(popularDiets),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          // Defina seus outros itens de BottomNavigationBarItem aqui
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('SphereLink', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/C.svg', height: 20, width: 20),
        onPressed: () {},
      ),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (String value) {
            if (value == 'logout') {
              FirebaseAuth.instance.signOut();
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'logout',
              child: Text('Logout'),
            ),
          ],
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search Pancake',
          hintStyle: const TextStyle(
            color: Color(0xffDDDADA),
            fontSize: 14,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/Filter.svg'),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Column _categoriesSection(List<CategoryModel> categories) {
  //   // Implementação da seção de categorias usando os dados de 'categories'
  //   // Similar ao que você já tinha, mas adaptado para funcionar com os dados passados como parâmetro
  // }

  // Column _dietSection(List<DietModel> diets) {
  //   // Implementação da seção de dietas usando os dados de 'diets'
  // }

  // Column _popularSection(List<PopularDietsModel> popularDiets) {
  //   // Implementação da seção de dietas populares usando os dados de 'popularDiets'
  // }
}
