
import 'package:flutter/material.dart';

import '../screen/fliter_screen.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, tapHandler)
  {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.pink.shade700,
            child: Text('Cooking Up',style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),),
          ),
         const SizedBox (
            height: 20,
          ),
          buildListTile('Meals',
              Icons.restaurant,
                  (){
            Navigator.of(context).pushReplacementNamed('/');
                  }
          ),
          buildListTile('Filters',
              Icons.settings,
            (){
              Navigator.of(context).pushReplacementNamed(FliterScreen.routeName);
            },
          ),
        ],
      ),



    );
  }
}
