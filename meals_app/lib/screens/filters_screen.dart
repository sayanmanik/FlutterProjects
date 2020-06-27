import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/filters_screen';

  final Function saveFilters;
  final Map<String,bool> filters;

  FiltersScreen(this.filters,this.saveFilters);

  @override
  _FiltersScreenState createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchTitle(
      String title, 
      String description,
      bool currentVal, 
      Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentVal,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchTitle(
                      'Gluten-Free',
                      'Only include gluten-free meals',
                      _glutenFree,
                      (newVal) => {
                            setState(() {
                              _glutenFree = newVal;
                            })
                          }),
                  _buildSwitchTitle(
                      'Lactose-Free',
                      'Only include lactose-free meals',
                      _lactoseFree,
                      (newVal) => {
                            setState(() {
                              _lactoseFree = newVal;
                            })
                          }),
                  _buildSwitchTitle(
                      'Vegatarian',
                      'Only include vegetarian meals',
                      _vegetarian,
                      (newVal) => {
                            setState(() {
                              _vegetarian = newVal;
                            })
                          }),
                  _buildSwitchTitle(
                      'Vegan',
                      'Only include vegan meals',
                      _vegan,
                      (newVal) => {
                            setState(() {
                              _vegan = newVal;
                            })
                          })
                ],
              ),
            )
          ],
        ));
  }
}