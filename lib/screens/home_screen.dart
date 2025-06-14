import 'package:flutter/material.dart';
import 'request_screen.dart';
import 'request_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> requests = [
    {
      'name': 'Aditi Patel',
      'bloodGroup': 'B+',
      'units': '2',
      'urgency': 'Critical within 4 hrs',
    },
    {
      'name': 'Sameer Khan',
      'bloodGroup': 'O-',
      'units': '1',
      'urgency': 'Urgent tomorrow',
    },
    {
      'name': 'Nikhil Joshi',
      'bloodGroup': 'AB+',
      'units': '3',
      'urgency': 'Scheduled - needed in 2 days',
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
                        children: const [
                          Text(
                            "Hi, Namya",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Ready to save a life today?",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
          // Navigate to request
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
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.search, size: 36),
              SizedBox(height: 8),
              Text("Request Blood", style: TextStyle(fontSize: 16)),
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
              )
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
                const Text("Urgent requests near you",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RequestScreen()),
                    );
                  },
                  child: const Text("See all requests >"),
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
                          Text("Name: ${req['name']}"),
                          Text("Blood Group: ${req['bloodGroup']}"),
                          if (req['units'] != null)
                            Text("Units: ${req['units']}"),
                          Text("Urgency: ${req['urgency']}"),
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
            const Text(
              "From Our Donor Wall",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
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
