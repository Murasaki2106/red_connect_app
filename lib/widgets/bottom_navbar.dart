import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Requests'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Donate'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'My Status'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
      ],
    );
  }
}
