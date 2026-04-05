import 'package:flutter/material.dart';
import 'dart:ui';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skillCategories = {
      'Mobile Development': {
        'icon': Icons.phone_android_rounded,
        'skills': ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'Hive', 'SharedPreferences', 'SQLite']
      },
      'Backend Development': {
        'icon': Icons.lan_rounded,
        'skills': ['ASP.NET Core', 'Web APIs', 'Entity Framework', 'SQL Server']
      },
      'Architecture & Patterns': {
        'icon': Icons.architecture_rounded,
        'skills': ['Clean Architecture', 'Clean Code', 'SOLID', 'MVC', 'MVVM', 'Bloc', 'Cubit', 'GetX']
      },
    };

    return Container(
      color: const Color(0xFF070B14),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF6366f1), Colors.cyanAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  'SKILLS & TECHNOLOGIES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 4,
                width: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6366f1), Colors.cyanAccent],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 80),
              ...skillCategories.entries.map((category) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            category.value['icon'] as IconData,
                            color: Colors.cyanAccent,
                            size: 32,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            category.key,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: (category.value['skills'] as List<String>).map((skill) {
                          return _SkillBadge(skill: skill);
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillBadge extends StatefulWidget {
  final String skill;
  const _SkillBadge({required this.skill});

  @override
  State<_SkillBadge> createState() => _SkillBadgeState();
}

class _SkillBadgeState extends State<_SkillBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: _isHovered 
                    ? Colors.cyanAccent.withOpacity(0.1) 
                    : Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: _isHovered 
                      ? Colors.cyanAccent 
                      : Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Text(
                  widget.skill,
                  style: TextStyle(
                    color: _isHovered ? Colors.white : Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
