import 'dart:async';
import 'package:blood_donation_app/screens/navigation.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'notifications_screen.dart';

class VerifiedScreen extends StatefulWidget {
  const VerifiedScreen({super.key});

  @override
  State<VerifiedScreen> createState() => _VerifiedScreenState();
}

class _VerifiedScreenState extends State<VerifiedScreen> {
  bool _messageTapped = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (_messageTapped) {
        Navigator.pushReplacement(
          context,
          //need to change redirect instead of home screen it should be notifiactions screen and the mess with notification screen.
          MaterialPageRoute(builder: (_) =>  HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  MainNavigation()),
        );
      }
    });
  }

  void _onViewMessage() {
    setState(() {
      _messageTapped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.red.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Notification",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text("Your blood donation request has been successfully accepted"),
                  GestureDetector(
                    onTap: _onViewMessage,
                    child: const Text(
                      "View message",
                      style: TextStyle(color: Colors.teal, decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const Text("Congratulations!\nYour account is verified", textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
