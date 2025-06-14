import 'package:flutter/material.dart';
import 'congrats_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountPage3 extends StatelessWidget {
  const CreateAccountPage3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Create Account", style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.black87)),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Image Banner
            Center(
              child: SizedBox(
                height: screenHeight * 0.25,
                child: Image.asset(
                  'assets/images/blank_pfp.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Progress Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDot(),
                const SizedBox(width: 8),
                buildDot(),
                const SizedBox(width: 8),
                buildDot(isActive: true),
              ],
            ),

            const SizedBox(height: 30),

            // Form & Upload Box in Constrained Width
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "verify your identity",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                     Text(
                      "Upload your photo",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                     Text(
                      "Aadhar Card/Pan Card/Driving License",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                    const SizedBox(height: 32),

                    // Upload Box
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade100,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "Upload your document here",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Image.asset(
                              'assets/images/doc_image.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Submit Button
                    Center(
                      child: SizedBox(
                        width: 180,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const CongratsScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(230, 57, 70, 1),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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

  // Helper: Dot Widget
  Widget buildDot({bool isActive = false}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromRGBO(230, 57, 70, 1)
            : Colors.grey.shade400,
        shape: BoxShape.circle,
      ),
    );
  }
}
