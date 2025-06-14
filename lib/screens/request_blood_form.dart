import 'package:flutter/material.dart';

class RequestBloodForm extends StatefulWidget {
  const RequestBloodForm({super.key});

  @override
  State<RequestBloodForm> createState() => _RequestBloodFormState();
}

class _RequestBloodFormState extends State<RequestBloodForm> {
  final _formKey = GlobalKey<FormState>();
  String _patientName = '';
  String _bloodGroup = 'O+';
  String _hospital = '';
  final List<String> _bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Blood'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Patient Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter patient name' : null,
                onSaved: (value) => _patientName = value!,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                value: _bloodGroup,
                items: _bloodGroups
                    .map((group) => DropdownMenuItem(
                          value: group,
                          child: Text(group),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _bloodGroup = value!),
                decoration: const InputDecoration(labelText: 'Blood Group Needed'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Hospital / Location'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter hospital/location' : null,
                onSaved: (value) => _hospital = value!,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Request Submitted')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
