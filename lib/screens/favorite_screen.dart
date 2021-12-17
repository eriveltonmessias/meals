import 'package:flutter/material.dart';
import 'package:meals/component/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
 
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {

    if(this.favoriteMeals.isEmpty){
    return Center(
      child: Text('Nenum item como favorito'),
    );
    }else{
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index){
          return MealItem(favoriteMeals[index]);
      });
    }

  }
}