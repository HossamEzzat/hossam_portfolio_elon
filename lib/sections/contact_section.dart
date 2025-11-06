import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.black.withOpacity(0.9),
      alignment: Alignment.center,
      child: const Text(
        "📧 Let's work together!\nEmail: hossamezzat199@gmail.com",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.cyanAccent,
          fontSize: 20,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
