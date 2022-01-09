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

  Sesttings sesttings = Sesttings();

 List<Meal> _availableMeals = DUMMY_MEALS;

 final List <Meal> _favoriteMeals = [];

void _filterMeals(Sesttings sesttings){
  
  setState(() {
    this.sesttings = sesttings;

    _availableMeals = DUMMY_MEALS.where((meals){
      final filterClutter = sesttings.isGlutenFree! && !meals.isGlutenFree;
      final filterlactose = sesttings.isLactoseFree! && !meals.isLactoseFree;
      final filterVegan = sesttings.isVegan! && !meals.isVegan;
      final filterVegetariam = sesttings.isVegetariam! && !meals.isVegetarian;

      return !filterClutter && !filterlactose && !filterVegan && !filterVegetariam;

    }).toList();
  });
}

void _toggleFavorite(Meal meal){
    _favoriteMeals.contains(meal) 
    ? _favoriteMeals.remove(meal)
    : _favoriteMeals.add(meal);
  
}

bool _isFavorite(Meal meal){
  return _favoriteMeals.contains(meal);
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
        AppRoutes.HOME: (ctx) =>  TabScreen(favoriteMeal: _favoriteMeals),
        AppRoutes.CATEGORIRY_MEALS: (ctx) =>  CategoryMealsScreen(meals: _availableMeals),
        AppRoutes.MEALS_DETAIL: (ctx) =>  MealDetailScreen(onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        AppRoutes.SETTINGS: (ctx) =>  SettingsScreen(onsSesttingChanged: _filterMeals, sesttings: sesttings)
      },
    );
  }
}