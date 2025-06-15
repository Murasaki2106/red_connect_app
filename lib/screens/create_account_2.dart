import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'create_account_3.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountPage2 extends StatefulWidget {
  final Map<String, dynamic>? userData;
  final String? userId;
  const CreateAccountPage2({super.key, this.userData, this.userId});

  @override
  State<CreateAccountPage2> createState() => _CreateAccountPage2State();
}

class _CreateAccountPage2State extends State<CreateAccountPage2> {
  final _formKey = GlobalKey<FormState>();
  final _contactNoController = TextEditingController();
  final _residenceController = TextEditingController();
  final _areaController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Pre-fill data if available
    if (widget.userData != null) {
      _contactNoController.text = widget.userData!['contactNo'] ?? '';
      _residenceController.text = widget.userData!['residence'] ?? '';
      _areaController.text = widget.userData!['area'] ?? '';
      _cityController.text = widget.userData!['city'] ?? '';
      _stateController.text = widget.userData!['state'] ?? '';
    }
  }

  @override
  void dispose() {
    _contactNoController.dispose();
    _residenceController.dispose();
    _areaController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  bool _validateInputs() {
    if (_contactNoController.text.trim().isEmpty) {
      _showSnackBar('Please enter your contact number', isError: true);
      return false;
    }

    if (_contactNoController.text.trim().length != 10) {
      _showSnackBar('Contact number must be 10 digits', isError: true);
      return false;
    }

    if (_residenceController.text.trim().isEmpty) {
      _showSnackBar('Please enter your residence address', isError: true);
      return false;
    }

    if (_areaController.text.trim().isEmpty) {
      _showSnackBar('Please enter your area', isError: true);
      return false;
    }

    if (_cityController.text.trim().isEmpty) {
      _showSnackBar('Please enter your city', isError: true);
      return false;
    }

    if (_stateController.text.trim().isEmpty) {
      _showSnackBar('Please enter your state', isError: true);
      return false;
    }

    return true;
  }

  void _handleNext() async {
    if (!_validateInputs()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Combine previous user data with current step data
      Map<String, dynamic> combinedUserData = {
        ...?widget.userData,
        'contactNo': _contactNoController.text.trim(),
        'residence': _residenceController.text.trim(),
        'area': _areaController.text.trim(),
        'city': _cityController.text.trim(),
        'state': _stateController.text.trim(),
        'step': 2, // Track which step user is on
      };

      // Navigate to next step with combined data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CreateAccountPage3(userData: combinedUserData),
        ),
      );
    } catch (e) {
      _showSnackBar('An error occurred. Please try again.', isError: true);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
            color: Colors.black87,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Center(
                child: SizedBox(
                  height: screenHeight * 0.20,
                  child: Image.asset(
                    'assets/images/blank_pfp.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              
              const SizedBox(height: 20),

              // Progress Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDot(isActive: false, isCompleted: true),
                  const SizedBox(width: 8),
                  buildDot(isActive: true),
                  const SizedBox(width: 8),
                  buildDot(),
                ],
              ),
              
              const SizedBox(height: 30),

              // Step Title
              Text(
                'Contact & Address Details',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              
              const SizedBox(height: 20),

              // Contact Number Field
              buildTextField(
                "Contact No.",
                _contactNoController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  if (value.length != 10) {
                    return 'Contact number must be 10 digits';
                  }
                  return null;
                },
                prefixIcon: Icons.phone,
              ),
              
              const SizedBox(height: 16),

              // Residence Field
              buildTextField(
                "Residence Address",
                _residenceController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your residence address';
                  }
                  return null;
                },
                prefixIcon: Icons.home,
                maxLines: 2,
              ),
              
              const SizedBox(height: 16),

              // Area Field
              buildTextField(
                "Area/Locality",
                _areaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your area';
                  }
                  return null;
                },
                prefixIcon: Icons.location_on,
              ),
              
              const SizedBox(height: 16),

              // City Field
              buildTextField(
                "City",
                _cityController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
                prefixIcon: Icons.location_city,
              ),
              
              const SizedBox(height: 16),

              // State Field
              buildTextField(
                "State",
                _stateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your state';
                  }
                  return null;
                },
                prefixIcon: Icons.map,
              ),
              
              const SizedBox(height: 32),

              // Next Button
              Center(
                child: SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(230, 57, 70, 1),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      disabledBackgroundColor: Colors.grey.shade400,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper: Dot Widget
  Widget buildDot({bool isActive = false, bool isCompleted = false}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isCompleted
            ? Colors.green
            : isActive
                ? const Color.fromRGBO(230, 57, 70, 1)
                : Colors.grey.shade400,
        shape: BoxShape.circle,
      ),
    );
  }

  // Helper: TextField Builder
  Widget buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    IconData? prefixIcon,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey.shade600) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromRGBO(230, 57, 70, 1)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}