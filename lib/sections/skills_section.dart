import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter',
      'Firebase',
      'Dart',
      'REST API',
      'UI/UX',
      'State Management (Cubit, Provider)',
      'Git & GitHub',
    ];

    return Container(
      color: Colors.black.withOpacity(0.9),
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text(
            '🧠 Skills',
            style: TextStyle(
              color: Colors.cyanAccent,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: skills
                .map((e) => Chip(
              backgroundColor: Colors.cyanAccent.withOpacity(0.2),
              label: Text(
                e,
                style: const TextStyle(color: Colors.cyanAccent),
              ),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
