// FILE: donor_details_form.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'home_screen.dart';
import 'notifications_screen.dart';
import 'verified_screen.dart';

class BloodDonorDetailsForm2 extends StatefulWidget {
  const BloodDonorDetailsForm2({super.key});

  @override
  State<BloodDonorDetailsForm2> createState() => _DonorDetailsFormState();
}

class _DonorDetailsFormState extends State<BloodDonorDetailsForm2> {
  final contactController = TextEditingController();
  final residenceController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  void _submitForm() async {
    // Show local notification
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'donation_channel_id',
      'Donation Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.initialize(const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ));

    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification',
      'Your blood donation request has been successfully accepted',
      platformDetails,
    );

    // Navigate to Verified screen with redirect
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => VerifiedScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Donation Form"),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: contactController,
              decoration: const InputDecoration(labelText: 'Contact no.'),
            ),
            TextField(
              controller: residenceController,
              decoration: const InputDecoration(labelText: 'Residence'),
            ),
            TextField(
              controller: areaController,
              decoration: const InputDecoration(labelText: 'Area'),
            ),
            TextField(
              controller: cityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: stateController,
              decoration: const InputDecoration(labelText: 'State'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
