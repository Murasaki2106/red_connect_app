import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'success_screen.dart';


class RequestForm2 extends StatelessWidget {
  final String bloodGroup;
  final String urgency;
  final int units;
  final String location;

  const RequestForm2({
    super.key,
    required this.bloodGroup,
    required this.urgency,
    required this.units,
    required this.location,
  });

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
                children:  [
                  Text("Patient Details", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 12),
                  TextField(decoration: InputDecoration(hintText: 'First Name')),
                  SizedBox(height: 8),
                  TextField(decoration: InputDecoration(hintText: 'Middle Name')),
                  SizedBox(height: 8),
                  TextField(decoration: InputDecoration(hintText: 'Last Name')),
                  SizedBox(height: 8),
                  TextField(decoration: InputDecoration(hintText: 'Age')),
                  SizedBox(height: 8),
                  TextField(decoration: InputDecoration(hintText: 'Gender')),
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
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.insert_drive_file, size: 40),
                    SizedBox(height: 8),
                    Text("Upload your document here")
                  ],
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
                  Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => SuccessScreen()),
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
