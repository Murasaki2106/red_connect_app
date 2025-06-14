import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class DescriptiveScreen3 extends StatelessWidget {
  const DescriptiveScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ),
          );
        },
        child: Center( // ✅ Center the main content block
          child: Container(
            width: 300, // ✅ Fixed width for consistent text-image alignment
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // ✅ Left-align text
              children: [
                // Title
                const Text(
                  'Hi, Welcome!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(29, 53, 87, 1),
                  ),
                  textAlign: TextAlign.left, // ✅ Ensure left alignment
                ),

                const Text(
                  'Instant Blood Connect',
                  style: TextStyle(
                    fontSize: 8,
                    color: Color.fromRGBO(230, 57, 70, 1),
                  ),
                  textAlign: TextAlign.left, // ✅ Ensure left alignment
                ),

                const SizedBox(height: 24),

                // Image centered in same width
                Center(
                  child: Image.asset(
                    'assets/images/nokia_image.png',
                    fit: BoxFit.contain,
                    width: 300, // ✅ Match container width
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
