import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Auth state stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign up with email and password
  Future<UserCredential?> signUpWithEmailPassword(
    String email, 
    String password, 
    Map<String, dynamic> userData
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user data to Firestore
      await _firestore.collection('users').doc(result.user!.uid).set({
        ...userData,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return result;
    } catch (e) {
      throw e;
    }
  }

  // Sign in with email and password
  Future<UserCredential?> signInWithEmailPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
  print('FirebaseAuthException Code: ${e}');
  print('FirebaseAuthException Message: ${e}');
      throw e;
    }
  }

  // Sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  // Get user data
  Future<DocumentSnapshot> getUserData() async {
    return await _firestore.collection('users').doc(currentUser!.uid).get();
  }
}