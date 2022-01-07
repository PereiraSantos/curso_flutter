import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/sesttings.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/setting_acreen.dart';
import 'package:meals/screens/tabs_scren.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 List<Meal> _availableMeals = DUMMY_MEALS;

void _filterMeals(Sesttings sesttings){
  
  setState(() {
    _availableMeals = DUMMY_MEALS.where((meals){
      final filterClutter = sesttings.isGlutenFree! && !meals.isGlutenFree;
      final filterlactose = sesttings.isLactoseFree! && !meals.isLactoseFree;
      final filterVegan = sesttings.isVegan! && !meals.isVegan;
      final filterVegetariam = sesttings.isVegetariam! && !meals.isVegetarian;

      return !filterClutter && !filterlactose && !filterVegan && !filterVegetariam;

    }).toList();
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        AppRoutes.HOME: (ctx) => const TabScreen(),
        AppRoutes.CATEGORIRY_MEALS: (ctx) =>  CategoryMealsScreen(meals: _availableMeals),
        AppRoutes.MEALS_DETAIL: (ctx) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) =>  SettingsScreen(onsSesttingChanged: _filterMeals)
      },
    );
  }
}