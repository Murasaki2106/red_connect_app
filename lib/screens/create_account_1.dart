import 'package:flutter/material.dart';
// You can replace this with the actual next page when ready
import 'create_account_2.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountPage1 extends StatefulWidget {
  const CreateAccountPage1({super.key});

  @override
  State<CreateAccountPage1> createState() => _CreateAccountPage1State();
}

class _CreateAccountPage1State extends State<CreateAccountPage1> {
  final _firstName = TextEditingController();
  final _middleName = TextEditingController();
  final _lastName = TextEditingController();
  final _age = TextEditingController();
  final _gender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height; // ✅ ADD THIS

    return Scaffold(
      appBar: AppBar(
        leading: IconButton( // ✅ BACK ICON
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),

        title: Text("Create Account", style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.black87)),
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
            child: SizedBox(
              height: screenHeight * 0.25,
              child: Image.asset(
                'assets/images/blank_pfp.png', // 🔁 Replace with your image
                fit: BoxFit.contain,
              ),
            ),
          ),

            // Progress Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDot(isActive: true),
                const SizedBox(width: 8),
                buildDot(),
                const SizedBox(width: 8),
                buildDot(),
              ],
            ),
            const SizedBox(height: 30),

            // Fields
            buildTextField("First Name", _firstName),
            const SizedBox(height: 16),

            buildTextField("Middle Name", _middleName),
            const SizedBox(height: 16),

            buildTextField("Last Name", _lastName),
            const SizedBox(height: 16),

            buildTextField("Age", _age, keyboardType: TextInputType.number),
            const SizedBox(height: 16),

            buildTextField("Gender", _gender),
            const SizedBox(height: 32),

            // Next Button
                        Center(
              child: SizedBox(
                // 🔽 Reduced width for capsule shape
                width: 180, // or any suitable value
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreateAccountPage2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(230, 57, 70, 1),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    // 🔽 Capsule shape
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
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

  // Helper: TextField Builder
  Widget buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
