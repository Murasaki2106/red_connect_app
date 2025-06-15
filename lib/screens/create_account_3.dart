import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'congrats_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';

class CreateAccountPage3 extends StatefulWidget {
  final Map<String, dynamic>? userData;
  final String? userId;

  const CreateAccountPage3({super.key, this.userData, this.userId});

  @override
  State<CreateAccountPage3> createState() => _CreateAccountPage3State();
}

class _CreateAccountPage3State extends State<CreateAccountPage3> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedDocument;
  Uint8List? _webDocument;
  bool _isLoading = false;
  bool _isUploading = false;
  String? _documentType;

  final List<String> _documentTypes = [
    'Aadhar Card',
    'PAN Card',
    'Driving License',
    'Voter ID',
    'Passport'
  ];

  @override
  void initState() {
    super.initState();
    print('CreateAccountPage3 - Received userData: ${widget.userData}');
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

  Future<void> _pickDocument() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          setState(() {
            _webDocument = bytes;
            _selectedDocument = null;
          });
        } else {
          setState(() {
            _selectedDocument = File(image.path);
            _webDocument = null;
          });
        }
        _showSnackBar('Document selected successfully');
      }
    } catch (e) {
      _showSnackBar('Error selecting document: ${e.toString()}', isError: true);
    }
  }

  Future<void> _takePhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          setState(() {
            _webDocument = bytes;
            _selectedDocument = null;
          });
        } else {
          setState(() {
            _selectedDocument = File(image.path);
            _webDocument = null;
          });
        }
        _showSnackBar('Document captured successfully');
      }
    } catch (e) {
      _showSnackBar('Error capturing document: ${e.toString()}', isError: true);
    }
  }

  Future<String?> _uploadDocument() async {
    try {
      setState(() {
        _isUploading = true;
      });

      final userId = widget.userId ?? FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) throw Exception('User not authenticated');

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('documents')
          .child(userId)
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      UploadTask uploadTask;
      if (kIsWeb && _webDocument != null) {
        uploadTask = storageRef.putData(_webDocument!);
      } else if (_selectedDocument != null) {
        uploadTask = storageRef.putFile(_selectedDocument!);
      } else {
        throw Exception('No document selected');
      }

      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading document: $e');
      throw Exception('Failed to upload document');
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  Future<void> _submitRegistration() async {
    if (_selectedDocument == null && _webDocument == null) {
      _showSnackBar('Please upload a document to continue', isError: true);
      return;
    }

    if (_documentType == null) {
      _showSnackBar('Please select document type', isError: true);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final documentUrl = await _uploadDocument();

      if (documentUrl == null) {
        throw Exception('Failed to upload document');
      }

      final userId = widget.userId ?? FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) throw Exception('User not authenticated');

      final completeUserData = {
        ...?widget.userData,
        'documentType': _documentType,
        'documentUrl': documentUrl,
        'isVerified': false,
        'registrationStatus': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'profileCompleted': true,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(completeUserData, SetOptions(merge: true));

      await FirebaseFirestore.instance.collection('verification_requests').add({
        'userId': userId,
        'documentType': _documentType,
        'documentUrl': documentUrl,
        'userData': completeUserData,
        'status': 'pending',
        'submittedAt': FieldValue.serverTimestamp(),
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const CongratsScreen()),
      );
    } catch (e) {
      print('Error submitting registration: $e');
      _showSnackBar('Registration failed. Please try again.', isError: true);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showDocumentPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickDocument();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _takePhoto();
                },
              ),
            ],
          ),
        );
      },
    );
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: screenHeight * 0.20,
                child: Image.asset(
                  'assets/images/blank_pfp.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDot(isActive: false, isCompleted: true),
                const SizedBox(width: 8),
                buildDot(isActive: false, isCompleted: true),
                const SizedBox(width: 8),
                buildDot(isActive: true),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verify Your Identity",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: const Color.fromRGBO(230, 57, 70, 1),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Upload a clear photo of your government-issued ID:",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _documentType,
                      decoration: InputDecoration(
                        labelText: "Select Document Type",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.credit_card),
                      ),
                      items: _documentTypes.map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _documentType = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: _showDocumentPicker,
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: (_selectedDocument != null || _webDocument != null)
                                ? const Color.fromRGBO(230, 57, 70, 1)
                                : Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: (_selectedDocument != null || _webDocument != null)
                              ? Colors.green.shade50
                              : Colors.grey.shade100,
                        ),
                        child: (_selectedDocument != null || _webDocument != null)
                            ? Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: kIsWeb
                                        ? Image.memory(
                                            _webDocument!,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.file(
                                            _selectedDocument!,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    size: 48,
                                    color: Colors.grey.shade600,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    "Tap to upload document",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Gallery • Camera",
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    if (_isUploading) ...[
                      const SizedBox(height: 16),
                      const Center(child: CircularProgressIndicator()),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          'Uploading document...',
                          style: GoogleFonts.roboto(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: 180,
                        child: ElevatedButton(
                          onPressed: (_isLoading || _isUploading)
                              ? null
                              : _submitRegistration,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(230, 57, 70, 1),
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
                              : Text(
                                  "Submit",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        "Your account will be verified within 24-48 hours",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
}