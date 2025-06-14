import 'package:flutter/material.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  final List<Map<String, String>> _camps = const [
    {
      'campName': 'Red Cross Blood Camp',
      'date': '10 June 2025',
      'location': 'Ellisbridge Red Cross Center, Ahmedabad',
    },
    {
      'campName': 'Youth Blood Donation Drive',
      'date': '12 June 2025',
      'location': 'LD Engineering College Grounds',
    },
    {
      'campName': 'Rotary Club Camp',
      'date': '15 June 2025',
      'location': 'Rotary Hall, CG Road',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate Blood - Upcoming Camps'),
      ),
      body: _camps.isEmpty
          ? const Center(child: Text('No upcoming camps available.'))
          : ListView.builder(
              itemCount: _camps.length,
              itemBuilder: (context, index) {
                final camp = _camps[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    title: Text(camp['campName']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${camp['date']}'),
                        Text('Location: ${camp['location']}'),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('You have shown interest in "${camp['campName']}"')),
                        );
                      },
                      child: const Text('Attend'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
