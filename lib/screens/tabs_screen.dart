import 'package:flutter/material.dart';
import 'package:meals/component/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
 
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


  int _selectedScreenIndex = 0;

   late List<Widget> _screens;



  final List<String> _titles = [
      'Categorias',
      'Meus favoritos'
  ];
 
  @override
  void initState(){
    super.initState();
    _screens = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals)
  ];
  }

  _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedScreenIndex]),
      ),
      drawer: Drawer(
        child: MainDrawer(),
        ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias'
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos'
          )
        ],), 
         );
  }
}