import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'request_screen.dart';
import 'donate_screen.dart';
import 'my_status_screen.dart';
import 'more_screen.dart';
import 'notifications_screen.dart';

class MainNavigation extends StatefulWidget {
  final Map<String, String>? form1Data;
  final Map<String, String>? form2Data;
  final String? timeAgo;

  const MainNavigation({
    super.key,
    this.form1Data,
    this.form2Data,
    this.timeAgo,
  });

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  Map<Text, Text> convertToTextMap(Map<String, String> stringMap) {
    return stringMap.map(
      (key, value) => MapEntry(
        Text(key, style: GoogleFonts.roboto()),
        Text(value, style: GoogleFonts.roboto()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      if (widget.form1Data != null && widget.form2Data != null && widget.timeAgo != null)
        NotificationsPage(
          form1Data: convertToTextMap(widget.form1Data!),
          form2Data: convertToTextMap(widget.form2Data!),
          timeAgo: widget.timeAgo!,
        )
      else
        RequestScreen(),
      DonateScreen(),
      //StatusScreen(),
      //ProfileScreen(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
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
