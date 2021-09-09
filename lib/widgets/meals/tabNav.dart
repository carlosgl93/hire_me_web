import 'package:flutter/material.dart';
import 'package:hire_me/screens/meals/meals.dart';
import 'package:hire_me/screens/meals/favouriteMeals.dart';

class TabNav extends StatefulWidget {
  const TabNav({Key? key}) : super(key: key);

  @override
  _TabNavState createState() => _TabNavState();
}

class _TabNavState extends State<TabNav> {
  final List<Map<String, Object>> _screens = [
    {
      'screen': Meals(),
      'title': 'Categories',
    },
    {
      'screen': FavouriteMeals(),
      'title': 'Favourites',
    }
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedPageIndex]['title'] as String),
      ),
      body: _screens[_selectedPageIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
