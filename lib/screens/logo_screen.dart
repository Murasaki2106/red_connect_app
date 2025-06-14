import 'package:blood_donation_app/screens/DescriptiveScreen1.dart';
import 'package:flutter/material.dart';
import 'DescriptiveScreen1.dart'; // Import the screen you want to navigate to

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 180, 185, 1),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque, // Ensures the whole screen is tappable
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DescriptiveScreen1()),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo image
                Image.asset(
                  'assets/images/red_connect_logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 30),

                // Justified text
                const Text(
                  'Red Connect ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black87,
                  ),
                ),
                const Text(
                  'Instant Blood Connect',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
