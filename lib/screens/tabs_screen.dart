import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController( 
      length: 2,
      child: Scaffold(appBar: AppBar(
          title: Text('Minhas comidas favoritas'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
               Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              )
            ],
          ),
        ),
        body: TabBarView(
          children:[
            CategoriesScreen(),
            FavoriteScreen()
          ] 
              
        ),
      )
    );
  }
}