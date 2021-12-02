import 'package:flutter/material.dart';
import 'package:meals/component/meal_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    Category category = ModalRoute.of(context)?.settings.arguments as Category;
  print('carregou');
    final categoriesMeals = DUMMY_MEALS
    .where((meal) => meal.categories.contains(category.id)).toList();
  print(categoriesMeals);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body:ListView.builder(
        itemCount: categoriesMeals.length,
        itemBuilder: (ctx, index){
        return MealItem(categoriesMeals[index]);
      },
      ),
    );
  }
}