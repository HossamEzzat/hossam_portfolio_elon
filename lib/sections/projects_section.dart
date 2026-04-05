import 'package:flutter/material.dart';
import 'dart:ui';
import 'project_details_screen.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'Z Store',
      'desc': 'A flagship e-commerce application featuring a complete shopping cycle, secure payments, and dynamic product management.',
      'tech': 'Flutter • REST API • Provider',
      'url': 'https://play.google.com/store/apps/details?id=org.zagsystems.z_store',
      'icon': Icons.storefront_rounded,
      'longDesc': 'Z Store is a high-performance e-commerce solution designed for ZagSystem. It provides a seamless user journey from product discovery to secure checkout, integrated with advanced state management and real-time order tracking.',
      'features': ['Electronic payment', 'Order history', 'Dynamic search', 'Push notifications'],
    },
    {
      'title': 'Fe Alsika',
      'desc': 'Smart transportation platform for tracking metro and bus routes with thousands of active users on Google Play.',
      'tech': 'Flutter • Firebase • Google Maps API',
      'url': 'https://play.google.com/store/apps/details?id=com.xseifoo.metro_bus',
      'icon': Icons.directions_transit_rounded,
      'longDesc': 'Fe Alsika (On the Track) is a public transit optimization app. It helps commuters navigate complex metro and bus networks in Egypt with live updates, route planning, and fare calculations.',
      'features': ['Live tracking', 'Interactive transit maps', 'Offline route data', 'User reviews'],
    },
    {
      'title': 'Bedu',
      'desc': 'Educational ecosystem focused on interactive learning resources and digital student management.',
      'tech': 'Flutter • Firebase Auth • Firestore',
      'url': 'https://play.google.com/store/apps/details?id=com.xseifoo.bedu',
      'icon': Icons.school_rounded,
      'longDesc': 'Bedu empowers students with a comprehensive digital library, interactive quizzes, and real-time progress monitoring. It bridges the gap between traditional learning and modern mobile education.',
      'features': ['Real-time quizzes', 'Progress analytics', 'Cloud storage', 'Secure authentication'],
    },
    {
      'title': 'Fsolutions',
      'desc': 'Enterprise HR ERP application integrated with Odoo for industrial attendance and workflow management.',
      'tech': 'Flutter • Odoo API • Clean Architecture',
      'url': 'https://play.google.com/store/apps/details?id=app.fsolutions.odoo_hr',
      'icon': Icons.business_rounded,
      'longDesc': 'Fsolutions is a specialized HR tool for enterprise employees. It provides a direct mobile interface into the Odoo ERP system, allowing for geo-fenced attendance tracking, leave requests, and internal communication.',
      'features': ['Odoo sync', 'Geo-attendance', 'Leave management', 'Internal directory'],
    },
    {
      'title': 'Alpha Learn',
      'desc': 'Comprehensive student-focused learning platform with interactive multimedia and cloud synchronization.',
      'tech': 'Flutter • Firebase • SharedPreferences',
      'url': 'https://play.google.com/store/apps/details?id=com.linkysoft.alfahima',
      'icon': Icons.menu_book_rounded,
      'longDesc': 'Alpha Learn is a modern educational platform designed for a streamlined student experience. It features interactive lessons, progress tracking, and localized content delivery optimized for high performance on all devices.',
      'features': ['Material design', 'Cloud sync', 'Lesson management', 'Student profiles'],
    },
    {
      'title': 'Followsy Feen',
      'desc': 'Financial management and expense tracking tool with visual budgeting analytics.',
      'tech': 'Flutter • Hive • LocalStorage',
      'url': 'https://play.google.com/store/apps/details?id=com.hossamezzataboroka.ahsably',
      'icon': Icons.account_balance_wallet_rounded,
      'longDesc': 'Followsy Feen (Where is the money) provides personal finance control at your fingertips. It focuses on privacy and speed, utilizing local databases for instant expense tracking and insightful spending reports.',
      'features': ['Budgeting tools', 'Privacy-first', 'Visual reports', 'Hive DB'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 1200;
    final isMedium = size.width > 800;
    final crossAxisCount = isWide ? 3 : (isMedium ? 2 : 1);

    return Container(
      color: const Color(0xFF070B14),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF6366f1), Colors.cyanAccent, Color(0xFF6366f1)],
                ).createShader(bounds),
                child: const Text(
                  'FEATURED PROJECTS',
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  childAspectRatio: 0.85,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return _ProjectCard(project: projects[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;

  void _navigateToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetailsScreen(
          title: widget.project['title'],
          shortDesc: widget.project['desc'],
          longDesc: widget.project['longDesc'] ?? widget.project['desc'],
          tech: widget.project['tech'],
          url: widget.project['url'],
          iconData: widget.project['icon'] as IconData,
          features: (widget.project['features'] as List<String>?) ?? [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: _navigateToDetails,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()..translate(0, _hover ? -10 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6366f1).withOpacity(_hover ? 0.2 : 0.05),
                blurRadius: _hover ? 40 : 20,
                spreadRadius: _hover ? 5 : 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: _hover ? Colors.cyanAccent.withOpacity(0.5) : Colors.white.withOpacity(0.1),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFF1E293B),
                              const Color(0xFF0F172A).withOpacity(0.8),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Hero(
                            tag: 'icon_${widget.project['title']}',
                            child: Icon(
                              widget.project['icon'] as IconData,
                              size: 80,
                              color: Colors.white.withOpacity(_hover ? 0.8 : 0.2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.project['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: Text(
                                widget.project['desc'],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: (widget.project['tech'] as String).split('•').map((tech) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.cyanAccent.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.cyanAccent.withOpacity(0.2)),
                                  ),
                                  child: Text(
                                    tech.trim(),
                                    style: const TextStyle(
                                      color: Colors.cyanAccent,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
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
