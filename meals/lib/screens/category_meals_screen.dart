import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {

  const CategoryMealsScreen({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS.where((meal){
      return  meal.categories.contains(category.id);
    }).toList();
    
    return Scaffold(
      appBar: AppBar(
        title:  Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index){
          return MealItem(meal: categoryMeals[index]);
        }),
      ),
    );
  }
}