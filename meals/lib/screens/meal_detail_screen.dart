import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({ Key? key }) : super(key: key);

  Widget _createsectionTitle(BuildContext context, String title) => 
    Container(margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, 
        style: Theme.of(context).textTheme.overline),
    );
  

  Widget _createSectionContainer(Widget child) =>
    Container(
      width: 300,
      height: 250,
      decoration:  BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: child
    );
  

  @override
  Widget build(BuildContext context) {

    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    
    return Scaffold(
      appBar: AppBar(
        title:  Text(meal.title),
      ),
      body:  SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl, fit: BoxFit.cover,
              ),
            ),
            _createsectionTitle(context, "Ingredientes"),
            _createSectionContainer(
                ListView.builder(
                itemCount: meal.ingredients.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                color: Theme.of(context).colorScheme.secondary,
                );
              }),
            ),
             _createsectionTitle(context, "Passo"),
            _createSectionContainer(
                ListView.builder(
                itemCount: meal.steps.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}'),
                      ),title: Text(meal.steps[index]),
                      ),
                      const Divider()
                    ],
                  );
                }
                ),
              ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.star),
        onPressed: (){
          Navigator.of(context).pop(meal);
        },
      ),
    );
  }
}