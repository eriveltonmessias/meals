
import 'package:flutter/material.dart';
import 'package:meals/component/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  late Settings settings;
  
  @override
  void initState(){
    super.initState();
    settings = widget.settings;
  }

Widget _createSwitch(String title, String subTitle, bool value, Function(bool) onChanged){
  return SwitchListTile.adaptive(
    value: value,
     onChanged:  (value){
       onChanged(value);
       widget.onSettingsChanged(settings);
     },
     title: Text(title),
     subtitle: Text(subTitle),
     );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
         children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações'
                ,
                style:  Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child:ListView(
                children: [
                  _createSwitch('Sem Glutén', 
                  'Só exibe refeições sem glúten!', 
                  settings.isGlutenFree, 
                  (value) =>  setState(() => settings.isGlutenFree = value)
                  ),

                  _createSwitch('Sem Lactose', 
                  'Só exibe refeições sem Lactose!', 
                  settings.isLactoseFree, 
                  (value) =>  setState(() => settings.isLactoseFree = value)
                  ),

                 _createSwitch('Veganas', 
                  'Só exibe refeições Veganas!', 
                  settings.isVegan, 
                  (value) =>  setState(() => settings.isVegan = value)
                  ),

                  _createSwitch('Vegetarianas', 
                  'Só exibe refeições Vegetarianas!', 
                  settings.isVegetarian, 
                  (value) =>  setState(() => settings.isVegetarian = value)
                  ),
                ],
              ) 
            )
         ],
      ) 
      );
  }
}