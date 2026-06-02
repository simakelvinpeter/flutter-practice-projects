import 'package:flutter/material.dart';

import 'my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.grey[100],
                  size: 72,
                ),
              ),
              const MyListTile(icon: Icons.home, text: 'Shop'),
              const MyListTile(icon: Icons.info, text: 'About'),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: MyListTile(icon: Icons.logout, text: 'Logout'),
          ),
        ],
      ),
    );
  }
}
