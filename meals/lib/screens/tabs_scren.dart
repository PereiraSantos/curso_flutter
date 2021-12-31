import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/category_screens.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({ Key? key }) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

int _selectededScreebIndex = 0;

final List<Widget> _screens = const [
  CategoryScreen(),
  FavoriteScreen()
];

_selectScreen(int index){
  setState(() {
    _selectededScreebIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("vamos Cozinhar"),
     
      ),
      body: _screens[_selectededScreebIndex],
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectScreen,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.yellow,
      selectedFontSize: 20,
      currentIndex: _selectededScreebIndex,
      type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categorias"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos"
            )
      ],
      ),
    );
  }
}