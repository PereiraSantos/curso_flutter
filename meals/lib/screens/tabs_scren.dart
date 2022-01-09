import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/category_screens.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {

  final List<Meal>? favoriteMeal;

  const TabScreen({ Key? key, this.favoriteMeal}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

int _selectededScreebIndex = 0;

List<Widget> _screens = [];

@override
void initState(){
  super.initState();
   _screens =  [
  const CategoryScreen(),
  FavoriteScreen(favoriteMeal: widget.favoriteMeal)
];
}

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