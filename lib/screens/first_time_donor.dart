import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FirstTimeDonorScreen extends StatefulWidget {
  const FirstTimeDonorScreen({super.key});

  @override
  State<FirstTimeDonorScreen> createState() => _FirstTimeDonorScreenState();
}

class _FirstTimeDonorScreenState extends State<FirstTimeDonorScreen> {
  String? _donorStatus; // 'yes' or 'no'
  DateTime? _lastDonationDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _lastDonationDate) {
      setState(() {
        _lastDonationDate = picked;
      });
    }
  }

  Widget _buildTipsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(34, 40, 49, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("\u{1F6A8} First-Time Donor Tips",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          const SizedBox(height: 12),
          _buildTip("Before Donation", [
            "Eat a healthy meal 2–3 hours before",
            "Drink plenty of water; stay hydrated",
            "Get enough sleep the night before",
            "Avoid alcohol 24h before donating",
            "Wear loose or short-sleeved clothing",
          ]),
          const SizedBox(height: 10),
          _buildTip("During Donation", [
            "Stay calm and relaxed",
            "Notify staff if you feel dizzy or uneasy",
            "Breathe normally and don't look away",
          ]),
          const SizedBox(height: 10),
          _buildTip("After Donation", [
            "Rest at donation site for 10–15 min",
            "Drink juice, eat a snack",
            "Avoid heavy exercise for the day",
          ]),
        ],
      ),
    );
  }

  Widget _buildTip(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            )),
        ...points.map((point) => Text("\u2022 $point",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 13,
            ))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 230, 233),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Blood Donation Form', style: GoogleFonts.roboto(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(230, 57, 70, 0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Are you a first time donor?",
                      style: GoogleFonts.roboto(fontSize: 18)),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Yes"),
                    leading: Radio<String>(
                      value: 'yes',
                      groupValue: _donorStatus,
                      onChanged: (value) {
                        setState(() => _donorStatus = value);
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("No"),
                    leading: Radio<String>(
                      value: 'no',
                      groupValue: _donorStatus,
                      onChanged: (value) {
                        setState(() => _donorStatus = value);
                      },
                    ),
                  ),
                ],
              ),
            ),

            if (_donorStatus == 'yes') _buildTipsCard(),

            if (_donorStatus == 'no') ...[
              const SizedBox(height: 20),
              Text("Last Time Donation Date",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => _selectDate(context),
                child: Container(
                  width: 120,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(34, 40, 49, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _lastDonationDate != null
                        ? DateFormat('dd').format(_lastDonationDate!)
                        : '--',
                    style: GoogleFonts.roboto(
                        color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ],

            const Spacer(),
            if (_donorStatus != null &&
                (_donorStatus == 'yes' || _lastDonationDate != null))
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Continue to next step
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(152, 223, 214, 1),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text("Next",
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              )
          ],
        ),
      ),
    );
  }
}
