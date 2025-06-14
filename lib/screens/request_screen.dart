import 'package:flutter/material.dart';
import 'request_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestScreen extends StatelessWidget {
  final List<Map<Text, Text>> requests = [
  {
    Text('name', style: GoogleFonts.roboto()): Text('Aditi Patel', style: GoogleFonts.roboto()),
    Text('bloodGroup', style: GoogleFonts.roboto()): Text('B+', style: GoogleFonts.roboto()),
    Text('units', style: GoogleFonts.roboto()): Text('2', style: GoogleFonts.roboto()),
    Text('urgency', style: GoogleFonts.roboto()): Text('Critical within 4 hrs', style: GoogleFonts.roboto()),
  },
  {
    Text('name', style: GoogleFonts.roboto()): Text('Sameer Khan', style: GoogleFonts.roboto()),
    Text('bloodGroup', style: GoogleFonts.roboto()): Text('O-', style: GoogleFonts.roboto()),
    Text('units', style: GoogleFonts.roboto()): Text('1', style: GoogleFonts.roboto()),
    Text('urgency', style: GoogleFonts.roboto()): Text('Urgent by tomorrow', style: GoogleFonts.roboto()),
  },
  {
    Text('name', style: GoogleFonts.roboto()): Text('Nikhil Joshi', style: GoogleFonts.roboto()),
    Text('bloodGroup', style: GoogleFonts.roboto()): Text('AB+', style: GoogleFonts.roboto()),
    Text('units', style: GoogleFonts.roboto()): Text('3', style: GoogleFonts.roboto()),
    Text('urgency', style: GoogleFonts.roboto()): Text('Scheduled – needed in 2 days', style: GoogleFonts.roboto()),
  },
  {
    Text('name', style: GoogleFonts.roboto()): Text('Anamika Verma', style: GoogleFonts.roboto()),
    Text('bloodGroup', style: GoogleFonts.roboto()): Text('B+', style: GoogleFonts.roboto()),
    Text('units', style: GoogleFonts.roboto()): Text('2', style: GoogleFonts.roboto()),
    Text('urgency', style: GoogleFonts.roboto()): Text('Emergency', style: GoogleFonts.roboto()),
  },
];


  RequestScreen({super.key}); // removed 'const' here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 235, 238, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: const Text(
          "Requests",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: ListView.builder(
              itemCount: requests.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  child: Card(
                    color: Colors.pink.shade100,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name: ${req['name']}'),
                                Text('Blood Group: ${req['bloodGroup']}'),
                                Text('Units Needed: ${req['units']}'),
                                Text('Urgency: ${req['urgency']}'),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/red_connect_logo_square.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Filter bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.filter_list),
                  Text("Filter"),
                  Spacer(),
                  Text("Blood Group"),
                  SizedBox(width: 20),
                  Text("Location"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
