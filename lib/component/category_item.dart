import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {

final Category category;

const CategoryItem(this.category);


void _selectCategory(BuildContext context){
 // Navigator.of(context).push(
   // MaterialPageRoute(builder: (_){
     // return CategoriesMealsScreen(category);
    //})
    //);

    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MAELS,
     arguments: category);
}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(category.title, 
        style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors:[
              category.color.withOpacity(0.5),
              category.color
            ],
            begin: Alignment.topLeft,
            end:  Alignment.bottomRight
            )
        ),
        ),
    );
  }
}