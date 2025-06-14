import 'package:flutter/material.dart';
import 'screens/logo_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(BloodDonationApp());
}


class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Red Connect',
      theme: AppTheme.lightTheme,
      home: LogoScreen(),

      debugShowCheckedModeBanner: false,
    );
  }
}
