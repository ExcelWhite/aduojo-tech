import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/constants.dart';


class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.burnishedBrown.withOpacity(0.4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SocialIcon(
            icon: FontAwesomeIcons.github,
            url: githubUrl,
          ),
          SizedBox(height: 20),
          SocialIcon(
            icon: FontAwesomeIcons.linkedin,
            url: linkedInUrl,
          ),
          SizedBox(height: 20),
          SocialIcon(
            icon: FontAwesomeIcons.envelope,
            url: gmailUrl,
          ),
          SizedBox(height: 20),
          SocialIcon(
            icon: FontAwesomeIcons.instagram,
            url: instagramUrl,
          ),
          SizedBox(height: 20),
          SocialIcon(
            icon: FontAwesomeIcons.telegram,
            url: telegramUrl,
          ),
        ],
      ),
    );
  }
}

class SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const SocialIcon({
    super.key,
    required this.icon,
    required this.url,
  });

  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool _isHovering = false;

  void _launchUrl() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      // Can't launch URL, handle error if needed
      debugPrint('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _isHovering ? AppColors.gildedEmerald.withOpacity(0.3) : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            widget.icon,
            color: _isHovering ? AppColors.gildedEmerald : AppColors.creamyIvory,
            size: 28,
          ),
        ),
      ),
    );
  }
}