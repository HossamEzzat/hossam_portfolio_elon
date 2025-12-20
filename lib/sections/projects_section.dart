import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'Fe Alsika',
      'desc':
          'A smart transportation app available on Google Play for tracking and booking metro and bus routes efficiently.',
      'tech': 'Flutter • Firebase • Google Maps API',
      'url':
          'https://play.google.com/store/apps/details?id=com.xseifoo.metro_bus',
    },
    {
      'title': 'Z Store',
      'desc':
          'E-commerce mobile application for products browsing and purchasing with secure checkout process.',
      'tech': 'Flutter • REST API • Provider State Management',
      'url':
          'https://play.google.com/store/apps/details?id=org.zagsystems.z_store',
    },
    {
      'title': 'Bedu',
      'desc':
          'Educational platform app providing student learning resources and quizzes through a modern UI.',
      'tech': 'Flutter • Firebase Auth • Firestore',
      'url': 'https://play.google.com/store/apps/details?id=com.xseifoo.bedu',
    },
    {
      'title': 'Fsolutions',
      'desc':
          'HR management app integrated with Odoo system for employee attendance and internal communication.',
      'tech': 'Flutter • Odoo API • Clean Architecture',
      'url':
          'https://play.google.com/store/apps/details?id=app.fsolutions.odoo_hr',
    },
    {
      'title': 'Al Fahima Platform',
      'desc':
          'An Arabic educational platform designed for children to learn interactively using modern visuals.',
      'tech': 'Flutter • Firebase • SharedPreferences',
      'url':
          'https://play.google.com/store/apps/details?id=com.linkysoft.alfahima',
    },
    {
      'title': 'Mafioso (Game App)',
      'desc':
          'A fun interactive Mafia-style game built with Flutter and custom animations, available on GitHub.',
      'tech': 'Flutter • Flame Engine • GitHub Project',
      'url': 'https://github.com/HossamEzzat/mafioso',
    },
    {
      'title': 'Folowsy Feen',
      'desc':
          ' تطبيق فلوسي فين هو مدير النفقات الحديث والبديهي الذي صمم خصيصاً لمساعدتك على التحكم الكامل في أموالك.',
      'tech': 'Flutter • Hive • SharedPreferences',
      'url':
          'https://play.google.com/store/apps/details?id=com.hossamezzataboroka.ahsably',
    },
    {
      'title': 'احسبلي',
      'desc':
          'وداعاً لدفاتر الحسابات الورقية.. أهلاً بالإدارة الذكية! : هل تمتلك سيارة (أو أسطول سيارات) وتجد صعوبة في تتبع حسابات الورديات ومصاريف الصيانة؟ تطبيق احسبلي صُمم خصيصاً لمساعدتك على إدارة أسطولك بكل سهولة ودقة.',
      'tech': 'Flutter • Hive • SharedPreferences',
      'url':
          'https://play.google.com/store/apps/details?id=com.hossamezzataboroka.ahsably',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 900;
    final crossAxisCount = isWide ? 3 : (size.width > 600 ? 2 : 1);

    return Container(
      color: const Color(0xFF0B0F17),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: [
          const Text(
            '🚀 Projects',
            style: TextStyle(
              color: Colors.cyanAccent,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 50),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              childAspectRatio: isWide ? 1.3 : 1.1,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final p = projects[index];
              return _ProjectCard(
                title: p['title']!,
                desc: p['desc']!,
                tech: p['tech']!,
                url: p['url']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String desc;
  final String tech;
  final String url;

  const _ProjectCard({
    required this.title,
    required this.desc,
    required this.tech,
    required this.url,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hover
                ? Colors.cyanAccent
                : Colors.cyanAccent.withOpacity(0.3),
            width: 1.5,
          ),
          color: Colors.black.withOpacity(0.4),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(_hover ? 0.6 : 0.2),
              blurRadius: _hover ? 30 : 10,
              spreadRadius: _hover ? 2 : 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.cyanAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                widget.desc,
                style: const TextStyle(
                  color: Colors.white70,
                  height: 1.4,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              widget.tech,
              style: const TextStyle(
                color: Colors.cyanAccent,
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () async {
                  final uri = Uri.parse(widget.url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.cyanAccent, width: 1.3),
                    color: _hover
                        ? Colors.cyanAccent.withOpacity(0.1)
                        : Colors.transparent,
                  ),
                  child: const Text(
                    'View Project',
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 13,
                      letterSpacing: 1,
                    ),
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
