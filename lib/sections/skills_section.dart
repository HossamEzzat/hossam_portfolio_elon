import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skillCategories = {
      'Mobile Development': ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'Hive', 'SharedPreferences', 'SQLite'],
      'Backend Development': ['ASP.NET Core', 'Web APIs', 'Entity Framework', 'SQL Server'],
      'Architecture & Patterns': ['Clean Architecture', 'Clean Code', 'SOLID', 'MVC', 'MVVM', 'Bloc', 'Cubit', 'GetX'],
    };

    return Container(
      color: Colors.black.withOpacity(0.9),
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF6366f1), Colors.cyanAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Text(
              '🧠 Skills & Technologies',
              style: TextStyle(
                color: Colors.white, // Color is masked by Shader
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 60),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                children: skillCategories.entries.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.key,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: category.value.map((skill) {
                            return Chip(
                              backgroundColor: Colors.cyanAccent.withOpacity(0.1),
                              side: BorderSide(color: Colors.cyanAccent.withOpacity(0.3)),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              label: Text(
                                skill,
                                style: const TextStyle(
                                  color: Colors.cyanAccent,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
