import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class ProjectDetailsScreen extends StatelessWidget {
  final String title;
  final String shortDesc;
  final String longDesc;
  final String tech;
  final String url;
  final IconData iconData;
  final List<String> features;

  const ProjectDetailsScreen({
    super.key,
    required this.title,
    required this.shortDesc,
    required this.longDesc,
    required this.tech,
    required this.url,
    required this.iconData,
    required this.features,
  });

  Future<void> _launchUrl() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070B14),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section for Project
            Container(
              height: 450,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1E293B),
                    Color(0xFF070B14),
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                   const Positioned.fill(
                    child: Opacity(
                      opacity: 0.1,
                      child: GridPaper(
                        color: Colors.cyanAccent,
                        interval: 100,
                        divisions: 1,
                        subdivisions: 1,
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'icon_$title',
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyanAccent.withOpacity(0.2),
                            blurRadius: 60,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Icon(
                        iconData,
                        size: 150,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Transform.translate(
              offset: const Offset(0, -60),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          longDesc,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 60),

                        // Features
                        if (features.isNotEmpty) ...[
                          const _SectionTitle(title: 'KEY FEATURES'),
                          const SizedBox(height: 30),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: features.map((f) => _FeatureCard(feature: f)).toList(),
                          ),
                          const SizedBox(height: 60),
                        ],

                        // Technologies
                        const _SectionTitle(title: 'TECHNOLOGIES'),
                        const SizedBox(height: 30),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: tech.split('•').map((t) => _TechBadge(tech: t.trim())).toList(),
                        ),
                        const SizedBox(height: 80),

                        // Actions
                        Center(
                          child: _DetailActionButton(
                            label: 'VIEW LIVE PROJECT',
                            onTap: _launchUrl,
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
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

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.cyanAccent,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 3,
          width: 40,
          color: Colors.cyanAccent,
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String feature;
  const _FeatureCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: Colors.cyanAccent, size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              feature,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechBadge extends StatelessWidget {
  final String tech;
  const _TechBadge({required this.tech});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF6366f1).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF6366f1).withOpacity(0.3)),
      ),
      child: Text(
        tech,
        style: const TextStyle(color: Color(0xFF818CF8), fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _DetailActionButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _DetailActionButton({required this.label, required this.onTap});

  @override
  State<_DetailActionButton> createState() => _DetailActionButtonState();
}

class _DetailActionButtonState extends State<_DetailActionButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hover ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6366f1), Colors.cyanAccent],
              ),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.4),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Text(
              widget.label,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 2),
            ),
          ),
        ),
      ),
    );
  }
}
