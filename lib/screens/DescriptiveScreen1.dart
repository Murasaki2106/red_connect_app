import 'package:flutter/material.dart';
import 'descriptive_screen_2.dart';

class DescriptiveScreen1 extends StatelessWidget {
  const DescriptiveScreen1({super.key});

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
              builder: (context) => const DescriptiveScreen2(),
            ),
          );
        },
        child: Center( // ✅ center the content block
          child: Container(
            width: 300, // ✅ fixed width for consistent alignment
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // ✅ left-align text
              children: [
                // Title
                const Text(
                  'Hi, Welcome!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(29, 53, 87, 1),
                  ),
                  textAlign: TextAlign.left, // ✅ force left alignment
                ),

                const Text(
                  'Instant Blood Connect',
                  style: TextStyle(
                    fontSize: 8,
                    color: Color.fromRGBO(230, 57, 70, 1),
                  ),
                  textAlign: TextAlign.left, // ✅ force left alignment
                ),

                const SizedBox(height: 24),

                // Image centered inside the same-width container
                Center(
                  child: Image.asset(
                    'assets/images/strecther_image.png',
                    fit: BoxFit.contain,
                    width: 300, // ✅ match container width
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
