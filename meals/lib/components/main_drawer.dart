import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({ Key? key }) : super(key: key);

  Widget _createItem(IconData icon, String label, Function onTap){
  return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(label, style: 
      const TextStyle(
        fontSize: 24, 
        fontWeight: FontWeight.bold,
        ),),
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
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).secondaryHeaderColor,
            child: Text("Vamos conzinhar",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Theme.of(context).primaryColor)),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          _createItem(Icons.restaurant, "refeição", ()=> Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
          _createItem(Icons.settings, "Configuração", ()=> Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS))
        ],
      ),
    );
  }
}