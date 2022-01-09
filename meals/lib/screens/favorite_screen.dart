import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal>? favoriteMeal;

  const FavoriteScreen({ Key? key, this.favoriteMeal }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(favoriteMeal!.isEmpty){
      return const Text("Nenhuma Refeição marcada como favorita");
    }else{
      return ListView.builder(
        itemCount: favoriteMeal!.length,
        itemBuilder: (context, index){
          return MealItem(meal: favoriteMeal![index]);
        });
    }
  }
}
