import 'package:flutter/material.dart';
import 'request_screen.dart';
import 'request_detail_screen.dart';
import 'request_form_1.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<Text, Text>> requests = [
  { 
    Text("name", style: GoogleFonts.roboto()): Text('Aditi Patel', style: GoogleFonts.roboto()),
    Text('bloodGroup', style: GoogleFonts.roboto()): Text('B+', style: GoogleFonts.roboto()),
    Text('units', style: GoogleFonts.roboto()): Text('2', style: GoogleFonts.roboto()),
    Text('urgency', style: GoogleFonts.roboto()): Text('Critical within 4 hrs', style: GoogleFonts.roboto()),
  },
  {
    Text('name', style: GoogleFonts.roboto()): Text('Sameer Khan', style: GoogleFonts.roboto()),
    Text('bloodGroup', style: GoogleFonts.roboto()): Text('O-', style: GoogleFonts.roboto()),
    Text('units', style: GoogleFonts.roboto()): Text('1', style: GoogleFonts.roboto()),
    Text('urgency', style: GoogleFonts.roboto()): Text('Urgent tomorrow', style: GoogleFonts.roboto()),
  },
  {
    Text('name', style: GoogleFonts.roboto()): Text('Nikhil Joshi', style: GoogleFonts.roboto()),
    Text('bloodGroup', style: GoogleFonts.roboto()): Text('AB+', style: GoogleFonts.roboto()),
    Text('units', style: GoogleFonts.roboto()): Text('3', style: GoogleFonts.roboto()),
    Text('urgency', style: GoogleFonts.roboto()): Text('Scheduled - needed in 2 days', style: GoogleFonts.roboto()),
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

                // Greeting Text (Expanded for center alignment)
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
                    // Handle bell tap
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
            const SizedBox(height: 16),

            // Action buttons
            // Action buttons (larger square style)
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
                            color: Colors.black.withOpacity(0.1),
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
                          Text("Request Blood", style: GoogleFonts.roboto(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to donate
                    },
                    child: Container(
                      height: 120,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade100,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
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
                  child: Text("See all requests >",style: GoogleFonts.roboto()),
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
                          Text("Name: ${req[Text('name')]}",style: GoogleFonts.roboto()),
                          Text("Blood Group: ${req[Text('bloodGroup')]}",style: GoogleFonts.roboto()),
                          if (req[Text('units')] != null)
                            Text("Units: ${req[Text('units')]}",style: GoogleFonts.roboto()),
                          Text("Urgency: ${req[Text('urgency')]}",style: GoogleFonts.roboto()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Donation Camp Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/address_image.png', // Replace with your actual asset
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            // From Donor Wall
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
                'assets/images/girl_image.png', // Replace with your actual asset
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),

      // Bottom nav (dummy)
    );
  }
}
