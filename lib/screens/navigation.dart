import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'request_screen.dart';
import 'donate_screen.dart';
import 'my_status_screen.dart';
import 'more_screen.dart';
import '../widgets/bottom_navbar.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    RequestScreen(),
    DonateScreen(),
    //StatusScreen(),
    //ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Donate'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'My Status'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Profile'),
        ],
      ),
    );
  }
}
