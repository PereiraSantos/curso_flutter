import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/sesttings.dart';

class SettingsScreen extends StatefulWidget {

  final Function(Sesttings)? onsSesttingChanged;

  const SettingsScreen({ Key? key, this.onsSesttingChanged }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

var sesting = Sesttings();

  Widget _createSwitch(String title, String subTitile, bool value, Function(bool) onChanged){
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subTitile),
        value: value,
        onChanged: (value){
          onChanged(value);
          widget.onsSesttingChanged!(sesting);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(title: const Text("Configuração"),),      
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text("Configuração", style: Theme.of(context).textTheme.subtitle1),
        ),
        Expanded(child: ListView(
          children: [
            _createSwitch("Sem gluttem", "So exibe refeiçãoes sem glutem", sesting.isGlutenFree!, 
            (value)=> setState(() => sesting.isGlutenFree = value)),

             _createSwitch("Sem Lactose", "So exibe refeiçãoes se lactose", sesting.isLactoseFree!, 
            (value)=> setState(() => sesting.isLactoseFree = value)),


             _createSwitch("Vegana", "So exibe refeiçãoes begna", sesting.isVegan!, 
            (value)=> setState(() => sesting.isVegan = value)),

             _createSwitch("Vegetariana ", "So exibe refeiçãoes Vegetariana", sesting.isVegetariam!, 
            (value)=> setState(() => sesting.isVegetariam = value))
          ],
        ))
      ],
      )
      
    );
  }
}