import 'package:flutter/material.dart';
import 'home_screen.dart'; // Just in case you use any info from it later
import 'navigation.dart'; // 👈

class CreateProfile extends StatelessWidget {
  final name = TextEditingController();
  final age = TextEditingController();
  final phone = TextEditingController();
  final city = TextEditingController();
  final gender = TextEditingController();
  final bloodGroup = TextEditingController();
  final id = TextEditingController();

  CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _inputField("Name", name),
            _inputField("Age", age),
            _inputField("Gender", gender),
            _inputField("Blood Group", bloodGroup),
            _inputField("Phone Number", phone),
            _inputField("City", city),
            _inputField("Identity Verification (Aadhar/PAN)", id),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ✅ Navigate to main app (home with bottom nav)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainNavigation()),
                );
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }
}
