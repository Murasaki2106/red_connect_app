import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'first_time_donor.dart';

class BloodDonationForm1Screen extends StatefulWidget {
  const BloodDonationForm1Screen({super.key});

  @override
  State<BloodDonationForm1Screen> createState() => _BloodDonationFormScreenState();
}

class _BloodDonationFormScreenState extends State<BloodDonationForm1Screen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool autoFill = false;

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  void _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Blood Donation Form',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: autoFill,
                  onChanged: (val) => setState(() => autoFill = val ?? false),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(166, 210, 226, 1),
                  ),
                  onPressed: () {},
                  child: const Text("Auto Fill"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color.fromRGBO(120, 147, 194, 0.55),
              child: Column(
                children: [
                  _buildTextField(firstNameController, 'First Name'),
                  _buildTextField(middleNameController, 'Middle Name'),
                  _buildTextField(lastNameController, 'Last Name'),
                  _buildTextField(ageController, 'Age'),
                  _buildTextField(genderController, 'Gender'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDateTimeCard(
                  label: 'Select Date',
                  value: selectedDate != null
                      ? '${selectedDate!.day}'
                      : '--',
                  onTap: _pickDate,
                  icon: Icons.calendar_today,
                ),
                _buildDateTimeCard(
                  label: 'Select Time',
                  value: selectedTime != null
                      ? selectedTime!.format(context)
                      : '--:--',
                  onTap: _pickTime,
                  icon: Icons.access_time,
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(166, 210, 226, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              onPressed: () 
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FirstTimeDonorScreen(), 
                    ),
                );

              },
              child: Text(
                'Next',
                style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Widget _buildDateTimeCard({
    required String label,
    required String value,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(label, style: GoogleFonts.roboto(fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            width: 60,
            height: 60,
            child: Center(
              child: value.contains(':')
                  ? Icon(icon, color: Colors.white)
                  : Text(
                      value,
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}