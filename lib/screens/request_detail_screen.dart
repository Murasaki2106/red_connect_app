import 'package:flutter/material.dart';

class RequestDetailScreen extends StatelessWidget {
  final Map<String, String> request;

  const RequestDetailScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 235, 238, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
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
                        Text("Name: ${request['name']}"),
                        Text("Blood Group: ${request['bloodGroup']}"),
                        Text("Units Needed: ${request['units']}"),
                        Text("Urgency: ${request['urgency']}"),
                        const Text("Location: Civil Hospital, Ahmedabad"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Note
            const Text(
              "Note:\nPatient is undergoing surgery.\nHospital verified request.",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 20),

            // Document (simulated)
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'assets/images/sample_request_doc.png', // Replace with your sample hospital doc image
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
                child: const Text(
                  'Connect',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
