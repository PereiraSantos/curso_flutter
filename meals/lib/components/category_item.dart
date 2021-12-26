import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';


class CategoryItem extends StatelessWidget {
  
  final Category? category;

  const CategoryItem({ Key? key , this.category}) : super(key: key);

 void _selectCategory(BuildContext context){
    /*Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_){
          return  CategoryMealsScreen(category: category);
        },
      ),
    );*/
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIRY_MEALS, 
      arguments: category!,
      );
  }
 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(category!.title, style: Theme.of(context).textTheme.overline),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
            category!.color!.withOpacity(0.3),
            category!.color!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          )
        ),
      ),
    );
  }
}
