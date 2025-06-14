import 'package:flutter/material.dart';
import 'request_detail_screen.dart';

class RequestScreen extends StatelessWidget {
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
      'urgency': 'Urgent by tomorrow',
    },
    {
      'name': 'Nikhil Joshi',
      'bloodGroup': 'AB+',
      'units': '3',
      'urgency': 'Scheduled – needed in 2 days',
    },
    {
      'name': 'Anamika Verma',
      'bloodGroup': 'B+',
      'units': '2',
      'urgency': 'Emergency',
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
