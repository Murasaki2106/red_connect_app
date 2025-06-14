import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navigation.dart';

class SuccessScreen extends StatelessWidget {
  final Map<String, String> form1Data;
  final Map<String, String> form2Data;
  final String timeAgo;

  const SuccessScreen({
    super.key,
    required this.form1Data,
    required this.form2Data,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.home, size: 28),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MainNavigation(
                        form1Data: form1Data,
                        form2Data: form2Data,
                        timeAgo: timeAgo,
                      ),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const MainNavigation()),
                    (route) => false,
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.teal, width: 8),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Image.asset('assets/images/tick_mark.png'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Thank You!',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
