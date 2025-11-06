import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.black.withOpacity(0.8),
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          "👋 I'm Hossam Ezzat, a passionate Flutter Developer.\n"
              "I build high-performance mobile apps with clean architecture, "
              "beautiful UI, and futuristic animations 🚀",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.cyanAccent,
            fontSize: 22,
            letterSpacing: 1.2,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
