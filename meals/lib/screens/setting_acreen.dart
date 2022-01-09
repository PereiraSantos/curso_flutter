import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/sesttings.dart';

class SettingsScreen extends StatefulWidget {

  final Function(Sesttings)? onsSesttingChanged;
  final Sesttings? sesttings;

  const SettingsScreen({ Key? key, this.onsSesttingChanged, this.sesttings }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

late Sesttings sesttings;

@override
void initState(){
  super.initState();
  sesttings = widget.sesttings!;
}

  Widget _createSwitch(String title, String subTitile, bool value, Function(bool) onChanged){
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subTitile),
        value: value,
        onChanged: (value){
          onChanged(value);
          widget.onsSesttingChanged!(sesttings);
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
            _createSwitch("Sem gluttem", "So exibe refeiçãoes sem glutem", sesttings.isGlutenFree!, 
            (value)=> setState(() => sesttings.isGlutenFree = value)),

             _createSwitch("Sem Lactose", "So exibe refeiçãoes se lactose", sesttings.isLactoseFree!, 
            (value)=> setState(() => sesttings.isLactoseFree = value)),


             _createSwitch("Vegana", "So exibe refeiçãoes begna", sesttings.isVegan!, 
            (value)=> setState(() => sesttings.isVegan = value)),

             _createSwitch("Vegetariana ", "So exibe refeiçãoes Vegetariana", sesttings.isVegetariam!, 
            (value)=> setState(() => sesttings.isVegetariam = value))
          ],
        ))
      ],
      )
      
    );
  }
}