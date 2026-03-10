import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'sections/hero_cyberspace.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';
void main() {
  runApp(const ElonPortfolio());
}

class ElonPortfolio extends StatelessWidget {
  const ElonPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hossam Ezzat | Flutter Developer',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B0F17),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ItemScrollController _scrollController = ItemScrollController();

  final sections = const [
    HeroCyberSpace(),
    AboutSection(),
    SkillsSection(),
    ExperienceSection(),
    ProjectsSection(),
    ContactSection(),
  ];

  void _scrollTo(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        elevation: 4,
        title: const Text(
          "Hossam Ezzat",
          style: TextStyle(color: Colors.cyanAccent),
        ),
        actions: [
          _navButton("About", 1),
          _navButton("Skills", 2),
          _navButton("Experience", 3),
          _navButton("Projects", 4),
          _navButton("Contact", 5),
          const SizedBox(width: 20),
        ],
      ),
      body: ScrollablePositionedList.builder(
        itemCount: sections.length,
        itemScrollController: _scrollController,
        itemBuilder: (context, index) => sections[index],
      ),
    );
  }

  Widget _navButton(String text, int index) {
    return TextButton(
      onPressed: () => _scrollTo(index),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.cyanAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
