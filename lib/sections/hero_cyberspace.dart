import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class HeroCyberSpace extends StatefulWidget {
  const HeroCyberSpace({super.key});

  @override
  State<HeroCyberSpace> createState() => _HeroCyberSpaceState();
}

class _HeroCyberSpaceState extends State<HeroCyberSpace>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _floatController;
  final List<Offset> _stars = List.generate(
    180,
        (index) => Offset(math.Random().nextDouble(), math.Random().nextDouble()),
  );

  @override
  void initState() {
    super.initState();

    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 25))
      ..repeat();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: Listenable.merge([_controller, _floatController]),
      builder: (context, _) {
        final floatOffset = math.sin(_floatController.value * 2 * math.pi) * 10;
        return CustomPaint(
          painter: _CyberSpacePainter(
            stars: _stars,
            progress: _controller.value,
          ),
          child: Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(0, floatOffset),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🪐 Typewriter name
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'HOSSAM EZZAT',
                        textStyle: TextStyle(
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyanAccent,
                          letterSpacing: 3,
                          shadows: [
                            Shadow(
                              color: Colors.cyanAccent.withOpacity(0.9),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        speed: const Duration(milliseconds: 120),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                  const SizedBox(height: 10),

                  // ✨ Animated subtext
                  AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 500),
                    animatedTexts: [
                      FadeAnimatedText(
                        'Flutter Developer 💙',
                        textStyle: _subTextStyle(size),
                      ),
                      FadeAnimatedText(
                        'Mobile App Developer ⚡',
                        textStyle: _subTextStyle(size),
                      ),
                      FadeAnimatedText(
                        'Creative Problem Solver 🧠',
                        textStyle: _subTextStyle(size),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // ⚡ Neon Contact Button
                  _HoverButton(),

                  const SizedBox(height: 40),

                  // 🌐 Social icons row (floating and glowing)
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 25,
                    children: [
                      _buildSocialIcon(FontAwesomeIcons.linkedin, 'LinkedIn',
                          'https://www.linkedin.com/in/hossam-ezzat-77245b204/'),
                      _buildSocialIcon(FontAwesomeIcons.github, 'GitHub',
                          'https://github.com/HossamEzzat'),
                      _buildSocialIcon(FontAwesomeIcons.whatsapp, 'WhatsApp',
                          'https://wa.me/201064224826'),
                      _buildSocialIcon(FontAwesomeIcons.facebook, 'Facebook',
                          'https://www.facebook.com/hossam.ezzat.342313/'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  TextStyle _subTextStyle(Size size) {
    return TextStyle(
      fontSize: size.width * 0.02,
      color: Colors.cyanAccent.withOpacity(0.9),
      letterSpacing: 1.5,
    );
  }

  Widget _buildSocialIcon(IconData icon, String tooltip, String url) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(seconds: 5),
      builder: (context, value, child) {
        final floatY = math.sin(value * 2 * math.pi) * 5;
        return Transform.translate(
          offset: Offset(0, floatY),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              child: Tooltip(
                message: tooltip,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.cyanAccent, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent.withOpacity(0.5),
                        blurRadius: 15,
                      )
                    ],
                  ),
                  child: Icon(icon, color: Colors.cyanAccent, size: 28),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HoverButton extends StatefulWidget {
  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse("mailto:hossamezzat199@gmail.com"));
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.cyanAccent, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(_hovering ? 0.8 : 0.3),
                blurRadius: _hovering ? 30 : 10,
                spreadRadius: _hovering ? 2 : 0,
              ),
            ],
          ),
          child: Text(
            'CONTACT ME',
            style: TextStyle(
              color: Colors.cyanAccent,
              letterSpacing: 2,
              fontWeight: FontWeight.w500,
              fontSize: _hovering ? 18 : 16,
            ),
          ),
        ),
      ),
    );
  }
}

class _CyberSpacePainter extends CustomPainter {
  final List<Offset> stars;
  final double progress;

  _CyberSpacePainter({required this.stars, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.cyanAccent.withOpacity(0.5);

    for (final star in stars) {
      final dx = (star.dx * size.width +
          math.sin(progress * 2 * math.pi + star.dy * 10) * 25) %
          size.width;
      final dy = (star.dy * size.height + progress * 50) % size.height;
      canvas.drawCircle(Offset(dx, dy), 1.2, paint);
    }

    final gridPaint = Paint()
      ..color = Colors.cyanAccent.withOpacity(0.07)
      ..strokeWidth = 0.5;
    for (double i = 0; i < size.width; i += 40) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), gridPaint);
    }
    for (double j = 0; j < size.height; j += 40) {
      canvas.drawLine(Offset(0, j), Offset(size.width, j), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _CyberSpacePainter oldDelegate) => true;
}
