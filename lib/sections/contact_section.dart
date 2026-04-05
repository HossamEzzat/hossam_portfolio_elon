import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF070B14),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.05),
                blurRadius: 50,
                spreadRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                padding: const EdgeInsets.all(60),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.cyanAccent.withOpacity(0.2),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.alternate_email_rounded,
                      size: 60,
                      color: Colors.cyanAccent,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "LET'S CONNECT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Ready to bring your mobility ideas to life?\nReach out at hossamezzat199@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 50),
                    _ContactButton(
                      icon: Icons.description_rounded,
                      label: 'VIEW MY RESUME',
                      onTap: () async {
                        final uri = Uri.parse(
                            'https://drive.google.com/file/d/1xRLhzedq_l91IOB-5QJi1SjstCNrpDwl/view?usp=sharing');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.externalApplication);
                        }
                      },
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

class _ContactButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              colors: _isHovered 
                ? [Colors.cyanAccent, const Color(0xFF6366f1)] 
                : [Colors.cyanAccent.withOpacity(0.1), Colors.white.withOpacity(0.05)],
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
            ],
            border: Border.all(
              color: _isHovered ? Colors.white : Colors.cyanAccent.withOpacity(0.5),
              width: 2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: _isHovered ? Colors.white : Colors.cyanAccent,
              ),
              const SizedBox(width: 15),
              Text(
                widget.label,
                style: TextStyle(
                  color: _isHovered ? Colors.white : Colors.cyanAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
