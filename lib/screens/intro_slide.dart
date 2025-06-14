import 'package:flutter/material.dart';
import 'login_signup.dart';

class IntroSlide extends StatelessWidget {
  const IntroSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Continue to Login / Sign Up"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginSignupScreen()),
            );
          },
        ),
      ),
    );
  }
}
