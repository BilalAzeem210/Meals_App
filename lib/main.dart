import 'package:flutter/material.dart';
import './model/meal.dart';
import './dummy_data.dart';
import './screen/categories_screen.dart';
import './screen/fliter_screen.dart';
import './screen/tabs_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/category_meals_screen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegetarian' : false,
    'vegan' : false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals =[];

  void _setFilters(Map<String, bool> filterData)
  {
    setState(() {
        _filters = filterData;
        _availableMeals = DUMMY_MEALS.where((meal) {
            if(_filters['gluten'] == true && !meal.isGlutenFree){
              return false;
            }
            if(_filters['lactos'] == true && !meal.isLactoseFree){
              return false;
            }
            if(_filters['vegan'] == true &&  !meal.isVegan){

              return false;
            }
            if(_filters['vegetarian'] == true && !meal.isVegetarian){

              return false;
            }
            return true;
        }).toList();
      });
  }

    void _toggleFavorite(String mealId)
    {
      final existingIndex =
          _favoritedMeals.indexWhere((meal) => meal.id == mealId);
      if(existingIndex >= 0){
        setState(() {
          _favoritedMeals.removeAt(existingIndex);
        });
      }
      else{
        setState(() {
          _favoritedMeals.add(
            DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
          );
        });
      }
    }

    bool _isMealFavorite(String id){
     return _favoritedMeals.any((meal) => meal.id == id);
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
        ),
      ),

//home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favoritedMeals),
        CategoryScreen.routeName : (ctx) => CategoryScreen(_availableMeals),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FliterScreen.routeName : (ctx) => FliterScreen(_filters,_setFilters),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
    );
  }
}



