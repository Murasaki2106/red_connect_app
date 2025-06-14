import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navigation.dart'; // 👈 Ensure this points to your main navigation screen

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => MainNavigation()),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✅ Custom tick image
                Image.asset(
                  'assets/images/tick_mark.png', // 👈 your custom tick image
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 24),

                // ✅ Justified text lines
                Text(
                  
                  'Congratulations!',
                  
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(fontWeight :FontWeight.bold, fontSize:  18, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                 Text(
                  'Your account is created',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
