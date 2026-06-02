import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key, required this.onTabChange});

  final void Function(int) onTabChange;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabChange,
      backgroundColor: Colors.grey[300],
      elevation: 0,
      selectedItemColor: Colors.grey.shade800,
      unselectedItemColor: Colors.grey.shade500,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
      ],
    );
  }
}
