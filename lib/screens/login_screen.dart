import 'package:flutter/material.dart';
import 'navigation.dart';
import 'login_signup.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: GestureDetector(
        onTap: () =>
            FocusScope.of(context).unfocus(), // dismiss keyboard on tap
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Image.asset(
                  'assets/images/red_connect_logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 30),

                // Username
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: GoogleFonts.roboto(),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromRGBO(120, 147, 194, 0.55),
                  ),
                ),
                const SizedBox(height: 16),

                // Password
                TextField(
                  controller: password,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: GoogleFonts.roboto(),
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: const Color.fromRGBO(120, 147, 194, 0.55),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Login Button
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromRGBO(230, 57, 70, 1),
                      shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )
                      
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => MainNavigation()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.roboto(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Sign Up prompt
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginSignupScreen(),
                      ),
                    );
                  },

                  child: Text(
                    "Don't have an account? Sign up.",
                    style: GoogleFonts.roboto(
                      color: Color.fromRGBO(230, 57, 70, 1),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
