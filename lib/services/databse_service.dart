import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Blood donation requests
  Future<void> createBloodRequest(Map<String, dynamic> requestData) async {
    await _firestore.collection('blood_requests').add({
      ...requestData,
      'userId': _auth.currentUser!.uid,
      'createdAt': FieldValue.serverTimestamp(),
      'status': 'active',
    });
  }

  Stream<QuerySnapshot> getBloodRequests() {
    return _firestore
        .collection('blood_requests')
        .where('status', isEqualTo: 'active')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // Donor registration
  Future<void> registerDonor(Map<String, dynamic> donorData) async {
    await _firestore.collection('donors').doc(_auth.currentUser!.uid).set({
      ...donorData,
      'userId': _auth.currentUser!.uid,
      'registeredAt': FieldValue.serverTimestamp(),
      'isAvailable': true,
    });
  }

  Stream<QuerySnapshot> getDonorsByBloodType(String bloodType) {
    return _firestore
        .collection('donors')
        .where('bloodType', isEqualTo: bloodType)
        .where('isAvailable', isEqualTo: true)
        .snapshots();
  }

  // Update user profile
  Future<void> updateUserProfile(Map<String, dynamic> userData) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update(userData);
  }
}