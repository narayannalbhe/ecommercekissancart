import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E3192), Color(0xFF1BFFFF)], // Blue Gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AI E-Commerce Illustration
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('assets/ai_ecommerce.png', height: 250), // Add a relevant image
            ),
            const SizedBox(height: 20),

            // App Title
            Text(
              "AI Commerce Builder",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            // Short Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Create and launch your online store in minutes with AI-powered automation!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Get Started Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Navigate to next screen
              },
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
