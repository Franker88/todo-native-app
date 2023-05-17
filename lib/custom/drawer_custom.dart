import 'package:flutter/material.dart';
import 'package:recipe_app/constants/coolors.dart';


class DrawerCustom extends StatefulWidget {
  const DrawerCustom({
    super.key,
  });

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  CoolorsLight actualTheme = CoolorsLight();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("assets/images/todoList.jpg"),
              ),
            ),
            child: Icon(Icons.person_3,size: 40,),
          ),
          ListTile(
            title: Text("Change Theme"),
          ),
          ListTile(
            
            title: Text("Exit"),
          ),
        ],
      ),
    );
  }
}