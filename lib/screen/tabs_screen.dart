
import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widget/main_drawer.dart';
import './categories_screen.dart';

import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   late List<Map<String,Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {
        'page':CategoriesScreen(),
        'title':'Categories',
      },
      {
        'page' : FavoritesScreen(widget.favoriteMeals),
        'title' : 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index)
  {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.pink.shade600,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedPageIndex,
        //  type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label:  'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label:  'Favorites',
            ),
          ],
        ),
    );
  }
}
