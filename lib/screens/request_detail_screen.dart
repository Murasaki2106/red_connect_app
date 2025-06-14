import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestDetailScreen extends StatelessWidget {
  final Map<Text, Text> request;

  const RequestDetailScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 235, 238, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // RedConnect logo + request card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/red_connect_logo_square.png',
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: \${request[Text('name')]!.data!}", style: GoogleFonts.roboto()),
                        Text("Blood Group: \${request[Text('bloodGroup')]!.data!}", style: GoogleFonts.roboto()),
                        Text("Units Needed: \${request[Text('units')]!.data!}", style: GoogleFonts.roboto()),
                        Text("Urgency: \${request[Text('urgency')]!.data!}", style: GoogleFonts.roboto()),
                        Text("Location: Civil Hospital, Ahmedabad", style: GoogleFonts.roboto()),
                        Text(
                          "Note:\nPatient is undergoing surgery.\nHospital verified request.",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const SizedBox(height: 20),

            // Document (simulated)
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'assets/images/sample_request_doc.png',
                height: 250,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),

            const Spacer(),

            // Connect button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Action on connect
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(144, 224, 239, 1),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'Connect',
                  style: GoogleFonts.roboto(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}