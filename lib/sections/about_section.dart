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
          "👋 I'm Hossam Ezzat, a Software Engineer focused on Flutter and mobile application development.\n\n"
              "I am experienced in building scalable apps using Clean Architecture and RESTful APIs. "
              "I am highly skilled in Firebase and state management, with strong backend experience using ASP.NET Core "
              "for building robust APIs and full-stack mobile solutions 🚀",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFE2E8F0),
            fontSize: 22,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
            height: 1.8,
          ),
        ),
      ),
    );
  }
}
