import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
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
      title: 'Hossam Ezzat Khalifa | Software Engineer',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF070B14),
        textTheme: GoogleFonts.outfitTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
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
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();

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
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: AppBar(
              backgroundColor: const Color(0xFF070B14).withOpacity(0.5),
              elevation: 0,
              centerTitle: false,
              title: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Hossam Ezzat Khalifa",
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              actions: [
                _navButton("About", 1),
                _navButton("Skills", 2),
                _navButton("Experience", 3),
                _navButton("Projects", 4),
                _navButton("Contact", 5),
                const SizedBox(width: 40),
              ],
            ),
          ),
        ),
      ),
      body: ScrollablePositionedList.builder(
        itemCount: sections.length,
        itemScrollController: _scrollController,
        itemPositionsListener: _itemPositionsListener,
        itemBuilder: (context, index) => sections[index],
      ),
    );
  }

  Widget _navButton(String text, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: _HoverNavButton(
        text: text,
        onTap: () => _scrollTo(index),
      ),
    );
  }
}

class _HoverNavButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _HoverNavButton({required this.text, required this.onTap});

  @override
  State<_HoverNavButton> createState() => _HoverNavButtonState();
}

class _HoverNavButtonState extends State<_HoverNavButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _hovering ? Colors.cyanAccent.withOpacity(0.1) : Colors.transparent,
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: _hovering ? Colors.cyanAccent : Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
