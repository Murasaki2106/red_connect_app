import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'success_screen.dart'; // changed from home_screen.dart

class RequestForm2 extends StatefulWidget {
  final Map<Text, Text> form1Data;

  const RequestForm2({
    super.key,
    required this.form1Data,
  });

  @override
  State<RequestForm2> createState() => _RequestForm2State();
}

class _RequestForm2State extends State<RequestForm2> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController prescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Blood Request Form", style: GoogleFonts.roboto(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Patient Details", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  TextField(controller: firstNameController, decoration: const InputDecoration(hintText: 'First Name')),
                  const SizedBox(height: 8),
                  TextField(controller: middleNameController, decoration: const InputDecoration(hintText: 'Middle Name')),
                  const SizedBox(height: 8),
                  TextField(controller: lastNameController, decoration: const InputDecoration(hintText: 'Last Name')),
                  const SizedBox(height: 8),
                  TextField(controller: ageController, decoration: const InputDecoration(hintText: 'Age')),
                  const SizedBox(height: 8),
                  TextField(controller: genderController, decoration: const InputDecoration(hintText: 'Gender')),
                  const SizedBox(height: 8),
                  TextField(controller: mobileController, decoration: const InputDecoration(hintText: 'Mobile Number')),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text("Upload photo\nHospital/ Doctor’s Prescription", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: prescriptionController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Paste or describe your document here",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade100,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 3,
                ),
                onPressed: () {
                  // Convert form2Data as <String, String>
                  final Map<String, String> form2Data = {
                    'name': '${firstNameController.text} ${middleNameController.text} ${lastNameController.text}',
                    'age': ageController.text,
                    'gender': genderController.text,
                    'mobile': mobileController.text,
                    'prescription': prescriptionController.text,
                  };

                  // Also convert form1Data <Text, Text> to <String, String>
                  final Map<String, String> form1Data = widget.form1Data.map(
                    (key, value) => MapEntry(key.data ?? '', value.data ?? ''),
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SuccessScreen(
                        form1Data: form1Data,
                        form2Data: form2Data,
                        timeAgo: 'Just now',
                      ),
                    ),
                  );
                },
                child: const Text("Submit", style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
