import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildTile(String title, IconData icon,Function function) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      onTap: function,
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
          color: Theme.of(context).accentColor,
          child: Text('Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor)),
        ),
        SizedBox(height: 20),
        buildTile(
          'Meals', 
          Icons.restaurant,
          (){
            Navigator.of(context).pushNamed('/');
        }),
        buildTile(
          'Filters', 
          Icons.settings,
          (){
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }
        )
      ],
    ));
  }
}
