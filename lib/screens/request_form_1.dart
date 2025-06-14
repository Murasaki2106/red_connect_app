import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'request_form_2.dart';

class RequestForm1 extends StatefulWidget {
  const RequestForm1({super.key});

  @override
  State<RequestForm1> createState() => _RequestForm1State();
}

class _RequestForm1State extends State<RequestForm1> {
  String? selectedBloodGroup;
  String? urgencyLevel;
  int unitCount = 1;
  String location = '';

  final bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Blood Request Form",
          style: GoogleFonts.roboto(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildSection(
              title: "Select Blood Group",
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: bloodGroups.map((group) {
                  return ChoiceChip(
                    label: Text(group, style: GoogleFonts.roboto()),
                    selected: selectedBloodGroup == group,
                    onSelected: (_) {
                      setState(() => selectedBloodGroup = group);
                    },
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            _buildSection(
              title: "No. of units required",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      if (unitCount > 1) setState(() => unitCount--);
                    },
                  ),
                  Text(unitCount.toString(), style: GoogleFonts.roboto(fontSize: 20)),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () => setState(() => unitCount++),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _buildSection(
              title: "Urgency Level",
              child: Column(
                children: [
                  _urgencyOption("Critical (need in <6 hrs)"),
                  _urgencyOption("Urgent (need in <24 hrs)"),
                  _urgencyOption("Scheduled (need in 2–3 days)"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _buildSection(
              title: "Select Location",
              child: TextField(
                onChanged: (val) => location = val,
                style: GoogleFonts.roboto(),
                decoration: InputDecoration(
                  hintText: "Enter location",
                  hintStyle: GoogleFonts.roboto(),
                  suffixIcon: const Icon(Icons.location_on),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.teal.shade100,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RequestForm2(
                        bloodGroup: selectedBloodGroup ?? '',
                        urgency: urgencyLevel ?? '',
                        units: unitCount,
                        location: location,
                      ),
                    ),
                  );
                },
                child: Text("Next", style: GoogleFonts.roboto(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _urgencyOption(String label) {
    return RadioListTile<String>(
      title: Text(label, style: GoogleFonts.roboto()),
      value: label,
      groupValue: urgencyLevel,
      onChanged: (value) => setState(() => urgencyLevel = value),
    );
  }
}
