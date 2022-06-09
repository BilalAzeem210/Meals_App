import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../model/meal.dart';
class FavoritesScreen extends StatelessWidget {

  List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
   if(favoriteMeals.isEmpty) {
    return Center(
       child: Text('You Have No Favorites Yet - Start Adding Some!'),
     );
   }
   else
     {
        return ListView.builder(itemBuilder: (ctx , index) {

          return MealItem(
            id:favoriteMeals[index].id,
            title:favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
          );

        },
            itemCount: favoriteMeals.length);
     }
  }
}
