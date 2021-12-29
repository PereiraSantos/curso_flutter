import 'package:flutter/material.dart';
import 'package:meals/screens/category_screens.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("vamos Cozinhar"),
          bottom: const  TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorite',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoryScreen(),
            FavoriteScreen(),
          ],
          ),
      ),
    
    );
  }
}