import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/category_screens.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229,1),
        textTheme: ThemeData.light().textTheme.copyWith(
          overline: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed'
          )
        ), 
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber)
      ),
  
      routes: {
        AppRoutes.HOME: (ctx) => const CategoryScreen(),
        AppRoutes.CATEGORIRY_MEALS: (ctx) => const CategoryMealsScreen()
      },
    );
  }
}