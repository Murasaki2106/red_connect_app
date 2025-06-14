import 'package:flutter/material.dart';

class MyStatusScreen extends StatelessWidget {
  const MyStatusScreen({super.key});

  final Map<String, dynamic> _userStatus = const {
    'name': 'Nico Shah',
    'bloodGroup': 'O+',
    'lastDonated': 'March 2025',
    'donations': 4,
    'activeRequest': {
      'hospital': 'Shalby Hospital, Ahmedabad',
      'date': '6 June 2025',
      'status': 'Pending'
    }
  };

  @override
  Widget build(BuildContext context) {
    final request = _userStatus['activeRequest'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: const Text('Name'),
                subtitle: Text(_userStatus['name']),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Blood Group'),
                subtitle: Text(_userStatus['bloodGroup']),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Last Donation'),
                subtitle: Text(_userStatus['lastDonated']),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Total Donations'),
                subtitle: Text('${_userStatus['donations']}'),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Active Blood Request',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text(request['hospital']),
                subtitle: Text('Date: ${request['date']}'),
                trailing: Text(request['status']),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
