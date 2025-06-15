import 'package:flutter/material.dart';
import 'create_account_2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateAccountPage1 extends StatefulWidget {
  final String userId;
  final String email;
  const CreateAccountPage1({
    super.key,
    required this.userId, 
    required this.email  
  });

  @override
  State<CreateAccountPage1> createState() => _CreateAccountPage1State();
}

class _CreateAccountPage1State extends State<CreateAccountPage1> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  
  String? _selectedGender;
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];
  
  void _nextPage() {
    if (_formKey.currentState!.validate()) {
      // Collect form data
      Map<String, dynamic> userData = {
        'userId': widget.userId,
        'email': widget.email,
        'firstName': _firstNameController.text.trim(),
        'middleName': _middleNameController.text.trim(),
        'lastName': _lastNameController.text.trim(),
        'age': int.parse(_ageController.text),
        'gender': _selectedGender,
        'phone': _phoneController.text.trim(),
      };
      
      // Navigate to next page with data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CreateAccountPage2(
            userData: userData,
            userId: widget.userId,
          ),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Please fill all required fields correctly',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Create Account", 
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Colors.black87
          )
        ),
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: screenHeight * 0.25,
                  child: Image.asset(
                    'assets/images/blank_pfp.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Progress Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDot(isActive: true),
                  const SizedBox(width: 8),
                  buildDot(),
                  const SizedBox(width: 8),
                  buildDot(),
                ],
              ),
              const SizedBox(height: 30),

              // Personal Information Header
              Text(
                "Personal Information",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(230, 57, 70, 1),
                ),
              ),
              const SizedBox(height: 20),

              // Fields
              buildTextFormField(
                "First Name", 
                _firstNameController,
                validator: RequiredValidator(errorText: 'First name is required'),
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              buildTextFormField(
                "Middle Name", 
                _middleNameController,
                isRequired: false,
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              buildTextFormField(
                "Last Name", 
                _lastNameController,
                validator: RequiredValidator(errorText: 'Last name is required'),
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

              buildTextFormField(
                "Age", 
                _ageController, 
                keyboardType: TextInputType.number,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Age is required'),
                  RangeValidator(
                    min: 18, 
                    max: 65, 
                    errorText: 'Age must be between 18 and 65 for blood donation'
                  ),
                ]),
                prefixIcon: Icons.cake_outlined,
              ),
              const SizedBox(height: 16),

              // Gender Dropdown
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: InputDecoration(
                  labelText: "Gender",
                  labelStyle: GoogleFonts.roboto(),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.wc_outlined),
                ),
                items: _genderOptions.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
                validator: (value) => value == null ? 'Please select your gender' : null,
              ),
              const SizedBox(height: 16),

              buildTextFormField(
                "Phone Number", 
                _phoneController,
                keyboardType: TextInputType.phone,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Phone number is required'),
                  PatternValidator(
                    r'^\d{10}$', 
                    errorText: 'Enter a valid 10-digit phone number'
                  ),
                ]),
                prefixIcon: Icons.phone_outlined,
              ),
              const SizedBox(height: 32),

              // Next Button
              Center(
                child: SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(230, 57, 70, 1),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: GoogleFonts.roboto(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper: Dot Widget
  Widget buildDot({bool isActive = false}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromRGBO(230, 57, 70, 1)
            : Colors.grey.shade400,
        shape: BoxShape.circle,
      ),
    );
  }

  // Helper: TextFormField Builder with validation
  Widget buildTextFormField(
    String label, 
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    bool isRequired = true,
    IconData? prefixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label + (isRequired ? ' *' : ''),
        labelStyle: GoogleFonts.roboto(),
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      ),
      validator: validator,
    );
  }
}