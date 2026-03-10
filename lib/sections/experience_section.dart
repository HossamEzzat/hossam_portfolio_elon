import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.85),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '💼 Experience & Education',
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 60),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildColumn(
                      title: 'Work Experience',
                      iconData: Icons.work_outline,
                      items: [
                        _buildTimelineItem(
                          title: 'Flutter Developer',
                          subtitle: 'SAF INVESTMENT GROUP / ZagSystem / Huma-valve / Elevate tech',
                          date: 'Multiple Companies (Part-time / Freelance)',
                          description: 'Designed and built high-performance, scalable mobile applications. Managed state using Provider, Bloc, and Cubit. Integrated RESTful APIs and Firebase services. Collaborated with design teams to ensure UI/UX consistency.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 1,
                    child: _buildColumn(
                      title: 'Education & Awards',
                      iconData: Icons.school_outlined,
                      items: [
                        _buildTimelineItem(
                          title: 'Bachelor of Computer and Information Science',
                          subtitle: 'Zagazig University, Egypt',
                          date: 'Graduation: 2023 | Grade: Very Good',
                          description: 'CS department focused on practical software engineering.',
                        ),
                        _buildTimelineItem(
                          title: 'Global & Regional Awards',
                          subtitle: 'Various Competitions',
                          date: '2022 - 2023',
                          description: '• Golden Medal – Climate Change Awareness App (1st Place Climathon EUI 2022)\n• 2nd Place – DevFest 2022 MENA Region\n• 2nd Place – Dell Competition (2023) Africa/Middle East\n• Huawei Academy Ambassador (2022)',
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

  Widget _buildColumn({
    required String title,
    required IconData iconData,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(iconData, color: Colors.cyanAccent, size: 28),
            const SizedBox(width: 12),
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
        const SizedBox(height: 30),
        ...items,
      ],
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required String date,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B).withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.cyanAccent.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.cyanAccent.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
