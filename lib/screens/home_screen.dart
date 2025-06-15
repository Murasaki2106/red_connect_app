import 'package:blood_donation_app/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'request_screen.dart';
import 'request_detail_screen.dart';
import 'request_form_1.dart';
import 'blood_donation_form1.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final Map<Text, Text>? form1Data;
  final Map<Text, Text>? form2Data;

  HomeScreen({super.key, this.form1Data, this.form2Data});

  List<Map<Text, Text>> requests = [
    {
      Text("name", style: GoogleFonts.roboto()): Text(
        'Aditi Patel',
        style: GoogleFonts.roboto(),
      ),
      Text('bloodGroup', style: GoogleFonts.roboto()): Text(
        'B+',
        style: GoogleFonts.roboto(),
      ),
      Text('units', style: GoogleFonts.roboto()): Text(
        '2',
        style: GoogleFonts.roboto(),
      ),
      Text('urgency', style: GoogleFonts.roboto()): Text(
        'Critical within 4 hrs',
        style: GoogleFonts.roboto(),
      ),
    },
    {
      Text('name', style: GoogleFonts.roboto()): Text(
        'Sameer Khan',
        style: GoogleFonts.roboto(),
      ),
      Text('bloodGroup', style: GoogleFonts.roboto()): Text(
        'O-',
        style: GoogleFonts.roboto(),
      ),
      Text('units', style: GoogleFonts.roboto()): Text(
        '1',
        style: GoogleFonts.roboto(),
      ),
      Text('urgency', style: GoogleFonts.roboto()): Text(
        'Urgent tomorrow',
        style: GoogleFonts.roboto(),
      ),
    },
    {
      Text('name', style: GoogleFonts.roboto()): Text(
        'Nikhil Joshi',
        style: GoogleFonts.roboto(),
      ),
      Text('bloodGroup', style: GoogleFonts.roboto()): Text(
        'AB+',
        style: GoogleFonts.roboto(),
      ),
      Text('units', style: GoogleFonts.roboto()): Text(
        '3',
        style: GoogleFonts.roboto(),
      ),
      Text('urgency', style: GoogleFonts.roboto()): Text(
        'Scheduled - needed in 2 days',
        style: GoogleFonts.roboto(),
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/red_connect_logo.png',
                  height: 48,
                  width: 48,
                ),

                // Greeting Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hi, Namya",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Ready to save a life today?",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Notification Bell
                GestureDetector(
                  onTap: () {
                    if (form1Data != null && form2Data != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NotificationsPage(
                            form1Data: form1Data!,
                            form2Data: form2Data!,
                            timeAgo:
                                '10', // You can calculate actual time diff if needed
                          ),
                        ),
                      );
                    }
                  },
                  child: Image.asset(
                    'assets/images/notification_bell.png',
                    height: 32,
                    width: 32,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RequestForm1()),
                      );
                    },
                    child: Container(
                      height: 120,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 36),
                          SizedBox(height: 8),
                          Text(
                            "Request Blood",
                            style: GoogleFonts.roboto(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BloodDonationForm1Screen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 120,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade100,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.bloodtype, size: 36),
                          SizedBox(height: 8),
                          Text("Donate Blood", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Urgent requests title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Urgent requests near you",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RequestScreen()),
                    );
                  },
                  child: Text(
                    "See all requests >",
                    style: GoogleFonts.roboto(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Horizontal scroll requests
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  final req = requests[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RequestDetailScreen(request: req),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${req[Text('name')]?.data ?? ''}",
                            style: GoogleFonts.roboto(),
                          ),
                          Text(
                            "Blood Group: ${req[Text('bloodGroup')]?.data ?? ''}",
                            style: GoogleFonts.roboto(),
                          ),
                          Text(
                            "Units: ${req[Text('units')]?.data ?? ''}",
                            style: GoogleFonts.roboto(),
                          ),
                          Text(
                            "Urgency: ${req[Text('urgency')]?.data ?? ''}",
                            style: GoogleFonts.roboto(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Address image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/address_image.png',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            // Donor wall
            Text(
              "From Our Donor Wall",
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/girl_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
