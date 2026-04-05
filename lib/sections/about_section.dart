import 'package:flutter/material.dart';
import 'dart:ui';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      color: const Color(0xFF070B14),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.05),
                blurRadius: 50,
                spreadRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                padding: const EdgeInsets.all(60),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.cyanAccent.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.cyanAccent.withOpacity(0.1),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 60,
                        color: Colors.cyanAccent,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "About Me",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "👋 I'm Hossam Ezzat Khalifa, a Software Engineer specializing in Flutter and full-stack mobile development.\n\n"
                      "I am experienced in building scalable, enterprise-grade applications using Clean Architecture, Clean Code, and SOLID principles. "
                      "While my forte is Flutter, I possess strong backend expertise with ASP.NET Core for building robust RESTful APIs "
                      "and complete mobile ecosystems. 🚀",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE2E8F0),
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0,
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
