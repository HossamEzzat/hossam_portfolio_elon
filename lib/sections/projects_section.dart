import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';
import 'project_details_screen.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'Fe Alsika',
      'desc':
          'A smart transportation app available on Google Play for tracking and booking metro and bus routes efficiently.',
      'longDesc':
          'Fe Alsika is a comprehensive smart transportation solution designed to make commuting via metro and bus seamless and efficient. It allows users to track routes, book tickets, and manage their daily travel plans directly from their smartphones, significantly reducing commute stress and wait times.',
      'tech': 'Flutter • Firebase • Google Maps API',
      'url':
          'https://play.google.com/store/apps/details?id=com.xseifoo.metro_bus',
      'icon': 'train',
      'features': [
        'Real-time metro and bus route tracking',
        'Secure online ticket booking system',
        'Interactive map integration using Google Maps',
        'User profile and travel history management',
      ],
    },
    {
      'title': 'Z Store',
      'desc':
          'E-commerce mobile application for products browsing and purchasing with secure checkout process.',
      'longDesc':
          'Z Store is a modern e-commerce mobile application that provides a seamless shopping experience. It features an intuitive interface for browsing products, a robust cart system, and a highly secure checkout process, ensuring a safe and enjoyable environment for online shoppers.',
      'tech': 'Flutter • REST API • Provider',
      'url':
          'https://play.google.com/store/apps/details?id=org.zagsystems.z_store',
      'icon': 'store',
      'features': [
        'Intuitive product catalog and advanced search',
        'Secure payment gateway integration',
        'Real-time order tracking and history',
        'State management using Provider for optimal performance',
      ],
    },
    {
      'title': 'Bedu',
      'desc':
          'Educational platform app providing student learning resources and quizzes through a modern UI.',
      'longDesc':
          'Bedu is an innovative educational platform tailored to enhance student learning. It offers a wide array of learning resources, interactive quizzes, and progress tracking, all wrapped in a sleek, modern user interface that keeps students engaged and motivated.',
      'tech': 'Flutter • Firebase Auth • Firestore',
      'url': 'https://play.google.com/store/apps/details?id=com.xseifoo.bedu',
      'icon': 'school',
      'features': [
        'Interactive quiz system with instant feedback',
        'Comprehensive library of learning materials',
        'Secure authentication via Firebase Auth',
        'Real-time data synchronization using Firestore',
      ],
    },
    {
      'title': 'Fsolutions',
      'desc':
          'HR management app integrated with Odoo system for employee attendance and internal communication.',
      'longDesc':
          'Fsolutions is an enterprise-grade HR management application tightly integrated with the Odoo ERP system. It streamlines critical HR processes, including employee attendance tracking, leave requests, and secure internal communication channels, empowering organizations to manage their workforce effectively.',
      'tech': 'Flutter • Odoo API • Clean Arch',
      'url':
          'https://play.google.com/store/apps/details?id=app.fsolutions.odoo_hr',
      'icon': 'business',
      'features': [
        'Direct integration with Odoo ERP modules',
        'Automated employee attendance tracking',
        'Streamlined leave request and approval workflows',
        'Built using robust Clean Architecture principles',
      ],
    },
    {
      'title': 'Al Fahima Platform',
      'desc':
          'An Arabic educational platform designed for children to learn interactively using modern visuals.',
      'longDesc':
          'Al Fahima Platform is a captivating educational application designed specifically for Arabic-speaking children. It utilizes vibrant, modern visuals and interactive lessons to make learning fundamental concepts fun and engaging, fostering a love for education from an early age.',
      'tech': 'Flutter • Firebase • SharedPreferences',
      'url':
          'https://play.google.com/store/apps/details?id=com.linkysoft.alfahima',
      'icon': 'child_care',
      'features': [
        'Engaging Arabic educational content for children',
        'Interactive lessons with rich multimedia visuals',
        'Cloud-based progress tracking via Firebase',
        'Local data caching for offline accessibility',
      ],
    },
    {
      'title': 'Mafioso (Game App)',
      'desc':
          'A fun interactive Mafia-style game built with Flutter and custom animations, available on GitHub.',
      'longDesc':
          'Mafioso is an entertaining, interactive mobile game inspired by the classic Mafia party game. Built entirely with Flutter and the Flame Engine, it features complex state management for game logic and custom, smooth animations to create immersive gameplay sessions with friends.',
      'tech': 'Flutter • Flame Engine',
      'url': 'https://github.com/HossamEzzat/mafioso',
      'icon': 'gamepad',
      'features': [
        'Complex multiplayer game logic implementation',
        'Custom 2D graphics and smooth animations via Flame',
        'Interactive role-playing mechanics',
        'Open-source repository available on GitHub',
      ],
    },
    {
      'title': 'Folowsy Feen',
      'desc':
          'تطبيق فلوسي فين هو مدير النفقات الحديث والبديهي الذي صمم خصيصاً لمساعدتك على التحكم الكامل في أموالك.',
      'longDesc':
          'تطبيق فلوسي فين (Where is My Money) is a modern and highly intuitive expense management tool. Designed for Arabic users, it provides comprehensive features to track daily expenses, manage budgets, and gain deep insights into financial habits, putting users in complete control of their money.',
      'tech': 'Flutter • Hive',
      'url':
          'https://play.google.com/store/apps/details?id=com.hossamezzataboroka.ahsably',
      'icon': 'attach_money',
      'features': [
        'Intuitive interface for tracking daily expenses',
        'Customizable budgeting tools and financial goals',
        'Fast and secure local database using Hive',
        'Detailed financial reporting and charts',
      ],
    },
    {
      'title': 'احسبلي',
      'desc':
          'تطبيق احسبلي صُمم خصيصاً لمساعدتك على إدارة أسطولك بكل سهولة ودقة لتتبع حسابات الورديات ومصاريف الصيانة.',
      'longDesc':
          'Ehsebely (Calculate For Me) is a specialized fleet management application designed to simplify the complex logistics of managing multiple vehicles. It provides tools for tracking driver shifts, calculating maintenance costs, and monitoring vehicle availability, ensuring maximum fleet efficiency.',
      'tech': 'Flutter • Hive • SharedPreferences',
      'url':
          'https://play.google.com/store/apps/details?id=com.hossamezzataboroka.ahsably',
      'icon': 'directions_car',
      'features': [
        'Comprehensive fleet and vehicle tracking',
        'Automated shift and maintenance cost calculations',
        'Offline-first capabilities using Hive database',
        'Detailed analytics for fleet optimization',
      ],
    },
  ];

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'train':
        return Icons.directions_transit;
      case 'store':
        return Icons.storefront;
      case 'school':
        return Icons.school;
      case 'business':
        return Icons.business;
      case 'child_care':
        return Icons.child_care;
      case 'gamepad':
        return Icons.sports_esports;
      case 'attach_money':
        return Icons.account_balance_wallet;
      case 'directions_car':
        return Icons.directions_car;
      default:
        return Icons.apps;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 1000;
    final isMedium = size.width > 650;
    final crossAxisCount = isWide
        ? 3
        : isMedium
            ? 2
            : 1;

    return Container(
      color: const Color(0xFF0B0F17),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Projects',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Some of the work I\'m most proud of',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 4,
                width: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF6366f1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 50),
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
                  final p = projects[index];
                  return _ProjectCard(
                    title: p['title']!,
                    desc: p['desc']!,
                    longDesc: p['longDesc'] ?? p['desc']!,
                    tech: p['tech']!,
                    url: p['url']!,
                    iconData: _getIconData(p['icon'] ?? ''),
                    features: (p['features'] as List<dynamic>?)
                            ?.map((e) => e.toString())
                            .toList() ??
                        [],
                  );
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
  final String title;
  final String desc;
  final String longDesc;
  final String tech;
  final String url;
  final IconData iconData;
  final List<String> features;

  const _ProjectCard({
    required this.title,
    required this.desc,
    required this.longDesc,
    required this.tech,
    required this.url,
    required this.iconData,
    required this.features,
  });

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
          title: widget.title,
          shortDesc: widget.desc,
          longDesc: widget.longDesc,
          tech: widget.tech,
          url: widget.url,
          iconData: widget.iconData,
          features: widget.features,
        ),
      ),
    );
  }

  Future<void> _launchExternalUrl() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _navigateToDetails,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              if (_hover)
                BoxShadow(
                  color: const Color(0xFF6366f1).withOpacity(0.3),
                  blurRadius: 30,
                  spreadRadius: 2,
                  offset: const Offset(0, 10),
                )
              else
                BoxShadow(
                  color: const Color(0xFF6366f1).withOpacity(0.05),
                  blurRadius: 15,
                  spreadRadius: 0,
                  offset: const Offset(0, 5),
                ),
            ],
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            transform: Matrix4.translationValues(0, _hover ? -10 : 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: _hover
                          ? const Color(0xFF6366f1).withOpacity(0.5)
                          : Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF1E293B),
                                    Color(0xFF0F172A),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Hero(
                                  tag: 'icon_${widget.title}',
                                  child: Icon(
                                    widget.iconData,
                                    size: 80,
                                    color: Colors.white.withOpacity(0.15),
                                  ),
                                ),
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: _hover ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 250),
                              child: Container(
                                color: const Color(0xFF0F172A).withOpacity(0.7),
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 12),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFF6366f1), Color(0xFF4F46E5)],
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFF6366f1).withOpacity(0.5),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'View Details',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: _navigateToDetails,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.open_in_new, size: 18, color: Color(0xFF94A3B8)),
                                      onPressed: _launchExternalUrl,
                                      tooltip: 'Open live link',
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Expanded(
                                  child: Text(
                                    widget.desc,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      height: 1.5,
                                      fontSize: 14,
                                    ),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: widget.tech.split('•').map((techElement) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF6366f1).withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: const Color(0xFF6366f1).withOpacity(0.3),
                                        ),
                                      ),
                                      child: Text(
                                        techElement.trim(),
                                        style: const TextStyle(
                                          color: Color(0xFF818CF8),
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
                      ),
                    ],
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
