import 'package:flutter/material.dart';
import '../model/meal.dart';

import '../widget/meal_item.dart';

class CategoryScreen extends StatefulWidget {

  static const routeName = '/category_meals';

  final List<Meal> availableMeals;

  CategoryScreen (this.availableMeals);


  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
 late String categoryTitle;
  late List<Meal> displayedMeal;
//  bool _loadedInitDate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void didChangeDependencies()
  {
    final routeArgs =
  ModalRoute.of(context)?.settings.arguments as Map<String, String>;
  categoryTitle = routeArgs['title']!;
  final categoryid = routeArgs['id'];
  displayedMeal = widget.availableMeals.where((meal) {
    return meal.categories.contains(categoryid);

  }).toList();


  super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text (categoryTitle ,style: const TextStyle(
          fontSize: 25,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: ListView.builder(itemBuilder: (ctx , index) {

        return MealItem(
          id:displayedMeal[index].id,
          title:displayedMeal[index].title,
          imageUrl: displayedMeal[index].imageUrl,
          duration: displayedMeal[index].duration,
          affordability: displayedMeal[index].affordability,
          complexity: displayedMeal[index].complexity,
        );

      },
          itemCount: displayedMeal.length),
    );
  }  }




