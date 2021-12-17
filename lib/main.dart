
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settings settings = Settings();
  List<Meal> _availableMeal = DUMMY_MEALS; 
   List<Meal> favoriteMeals = [];


  void _filterMeals(Settings settings){

    setState(() {

      this.settings = settings;
      _availableMeal = DUMMY_MEALS
      .where((meal) {
            final f1 = settings.isGlutenFree && !meal.isGlutenFree;
            final f2 = settings.isLactoseFree && !meal.isLactoseFree;
            final f3 = settings.isVegan && !meal.isVegan;
            final f4 = settings.isVegetarian && !meal.isVegetarian;

            return !f1 && !f2 && !f3 && !f4;
      }
      ).toList();

    });

  }

  void _toggleFavorite(Meal meal){

    setState(() {
       favoriteMeals.contains(meal) ? favoriteMeals.remove(meal) : favoriteMeals.add(meal);
    });

  }

  bool _isFavorite(Meal meal){
    return favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Conzinhar?',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed'
          )
        )
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(favoriteMeals),
        AppRoutes.CATEGORIES_MAELS: (ctx) => CategoriesMealsScreen(_availableMeal),
        AppRoutes.MAEL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals, settings),
      },
    );
  }
}
 
