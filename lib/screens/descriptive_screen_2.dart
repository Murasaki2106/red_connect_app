import 'package:flutter/material.dart';
import 'descriptive_screen_3.dart';

class DescriptiveScreen2 extends StatelessWidget {
  const DescriptiveScreen2({super.key});

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
              builder: (context) => const DescriptiveScreen3(),
            ),
          );
        },
        child: Center( // ✅ Align whole column to center
          child: Container(
            width: 300, // ✅ Set fixed width to match text and image
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

                // Centered image inside the same width box
                Center(
                  child: Image.asset(
                    'assets/images/iphone_image.png',
                    fit: BoxFit.contain,
                    width: 300, // ✅ Match container width for consistent layout
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
