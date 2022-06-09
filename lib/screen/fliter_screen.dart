import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';
class FliterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FliterScreen(this.currentFilter,this.saveFilters);

  @override
  State<FliterScreen> createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState()
  {
    _glutenFree = widget.currentFilter['gluten']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    _vegan = widget.currentFilter['vegan']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description, var currentValue,  updateValue,)
  {
    return  SwitchListTile(
      title: Text(title),
      value: currentValue,
      activeColor: Colors.amber,
      subtitle: Text(description),
      onChanged: updateValue,
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        actions: [
          IconButton(icon: Icon(Icons.save),
            onPressed: ()
            {
              final selectedFilters = {
                'gluten' : _glutenFree,
                'lactose' : _lactoseFree,
                'vegetarian' : _vegetarian,
                'vegan' : _vegan,
              };
              widget.saveFilters(selectedFilters);
            }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
              'Adjust your meal selection.',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    (newValue){
                  setState(() {
                    _glutenFree = newValue;
                  });
                    }
                ),
                _buildSwitchListTile('Lactos-free',
                    'Only include Lactos-free meals',
                    _lactoseFree,
                        (newValue){
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }
                ),

                _buildSwitchListTile('Vegetarian',
                    'Only include Vegetarian meals',
                    _vegetarian,
                        (newValue){
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }
                ),

                _buildSwitchListTile('Vegan',
                    'Only include Vegan meals',
                    _vegan,
                        (newValue){
                      setState(() {
                        _vegan = newValue;
                      });
                    }
                ),

              ],
            ),
          )
        ],
      ),
    );
  }}



