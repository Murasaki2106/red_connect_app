import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'request_detail_screen.dart';

class NotificationsPage extends StatelessWidget {
  final Map<Text, Text> form1Data;
  final Map<Text, Text> form2Data;
  final String timeAgo;

  
  const NotificationsPage({
    super.key,
    required this.form1Data,
    required this.form2Data,
    required this.timeAgo,
  });

  String getValue(Map<Text, Text> map, String key) {
    return map.entries
            .firstWhere(
              (entry) => entry.key.data == key,
              orElse: () => MapEntry(const Text(''), const Text('')),
            )
            .value
            .data ??
        '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.black),
          onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        ),
        title: Text(
          'Notification',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RequestDetailScreen(
                    request: {
                      Text('Name', style: GoogleFonts.roboto()):
                          Text(getValue(form2Data, 'name'), style: GoogleFonts.roboto()),
                      Text('Blood Group', style: GoogleFonts.roboto()):
                          Text(getValue(form1Data, 'bloodGroup'), style: GoogleFonts.roboto()),
                      Text('Units', style: GoogleFonts.roboto()):
                          Text(getValue(form1Data, 'units'), style: GoogleFonts.roboto()),
                      Text('Urgency', style: GoogleFonts.roboto()):
                          Text(getValue(form1Data, 'urgency'), style: GoogleFonts.roboto()),
                      Text('Location', style: GoogleFonts.roboto()):
                          Text(getValue(form1Data, 'location'), style: GoogleFonts.roboto()),
                      Text('Age', style: GoogleFonts.roboto()):
                          Text(getValue(form2Data, 'age'), style: GoogleFonts.roboto()),
                      Text('Mobile Number', style: GoogleFonts.roboto()):
                          Text(getValue(form2Data, 'mobile'), style: GoogleFonts.roboto()),
                      Text('Prescription', style: GoogleFonts.roboto()):
                          Text(getValue(form2Data, 'prescription'), style: GoogleFonts.roboto()),
                    },
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.shade100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$timeAgo seconds ago',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your blood request has been successfully accepted',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}