import 'package:flutter/material.dart';
import 'dart:ui';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF070B14),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.cyanAccent, Color(0xFF6366f1)],
                ).createShader(bounds),
                child: const Text(
                  'EXPERIENCE & EDUCATION',
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
                    colors: [Colors.cyanAccent, Color(0xFF6366f1)],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 80),
              
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _TimelineColumn(
                      title: 'Work Experience',
                      icon: Icons.work_history_rounded,
                      items: [
                        _TimelineItemData(
                          title: 'Mobile App Developer',
                          subtitle: 'SAF INVESTMENT GROUP',
                          date: 'Dec 2023 - Present',
                          description: 'Developing high-end fintech solutions. Expertise in Clean Architecture, state management (Bloc/Provider), and custom UI designs for complex business needs.',
                        ),
                        _TimelineItemData(
                          title: 'Flutter Developer',
                          subtitle: 'ZagSystem / Huma-valve / Elevate',
                          date: 'Nov 2021 - Nov 2023',
                          description: 'Freelance & Part-time development for multiple platforms. Focused on performance optimization, RESTful API integration, and Firebase backend services.',
                        ),
                        _TimelineItemData(
                          title: 'Programming Instructor',
                          subtitle: 'EraaSoft / Kian / MEC / Bright Brain',
                          date: '2022 - Present',
                          description: 'Mentoring 500+ students in Flutter and Dart development. Guided teams to winning national programming competitions.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: _TimelineColumn(
                      title: 'Education & Awards',
                      icon: Icons.auto_stories_rounded,
                      items: [
                        _TimelineItemData(
                          title: 'Bachelor of Computer Science',
                          subtitle: 'Zagazig University, Egypt',
                          date: 'Class of 2023',
                          description: 'CS Department | Grade: Very Good. Specialized in software engineering, algorithms, and modular design patterns.',
                        ),
                        _TimelineItemData(
                          title: 'Global & Regional Awards',
                          subtitle: 'First & Second Places',
                          date: '2022 - 2023',
                          description: '• Golden Medal – Climathon EUI 2022\n• 1st Place – Google Solution Challenge AOU 2023\n• 2nd Place – Dell Competition (Africa/MENA) 2023\n• 2nd Place – DevFest 2022',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineColumn extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<_TimelineItemData> items;

  const _TimelineColumn({
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.cyanAccent, size: 28),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        ...items.map((item) => _TimelineItem(data: item)).toList(),
      ],
    );
  }
}

class _TimelineItemData {
  final String title;
  final String subtitle;
  final String date;
  final String description;

  const _TimelineItemData({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.description,
  });
}

class _TimelineItem extends StatefulWidget {
  final _TimelineItemData data;
  const _TimelineItem({required this.data});

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isHovered ? Colors.cyanAccent : Colors.white24,
                    boxShadow: [
                      if (_isHovered)
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.6),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.white10,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 25),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: _isHovered 
                      ? Colors.cyanAccent.withOpacity(0.05) 
                      : Colors.white.withOpacity(0.02),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _isHovered 
                        ? Colors.cyanAccent.withOpacity(0.5) 
                        : Colors.white.withOpacity(0.05),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.data.subtitle,
                        style: TextStyle(
                          color: Colors.cyanAccent.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.data.date,
                        style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        widget.data.description,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
