import 'package:flutter/material.dart';
import 'descriptive_screen_3.dart';

class DescriptiveScreen2 extends StatelessWidget {
  const DescriptiveScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 235, 237, 1),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Align all center horizontally
            children: [
              // Title aligned to match image center
              const Text(
                'About Red Connect',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              // Line centered under the title
              Container(
                height: 2,
                color: Colors.redAccent,
                width: 180,
              ),

              const SizedBox(height: 24),

              // Big image aligned center
              Expanded(
                child: Image.asset(
                  'assets/images/your_big_image.png',
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
