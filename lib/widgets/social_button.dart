import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../core/colors.dart';
import '../core/responsive_helper.dart';
import '../core/responsive_typography.dart';
import '../models/social_link.dart';

class SocialButton extends StatefulWidget {
  const SocialButton({super.key, required this.link});

  final SocialLink link;

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _hovering = false;

  Future<void> _openLink() async {
    final url = widget.link.url;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final borderRadius = ResponsiveHelper.getResponsiveBorderRadius(
      screenWidth,
    );
    final bodyLargeFontSize = ResponsiveTypography.getBodyLargeFontSize(
      screenWidth,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: Animate(
        effects: [
          FadeEffect(duration: 600.ms),
          MoveEffect(begin: const Offset(0, 16), duration: 600.ms),
        ],
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOut,
          transform: Matrix4.identity()..scale(_hovering ? 1.03 : 1.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.88),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Theme.of(context).dividerColor.withOpacity(0.8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_hovering ? 0.22 : 0.12),
                blurRadius: _hovering ? 26 : 16,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: ListTile(
            onTap: _openLink,
            contentPadding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getHorizontalSpacing(screenWidth),
              vertical: ResponsiveHelper.getVerticalSpacing(screenWidth) / 2,
            ),
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.link.color.withOpacity(0.15),
              ),
              child: Icon(widget.link.icon, color: widget.link.color, size: 18),
            ),
            title: Text(
              widget.link.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color:
                    Theme.of(context).textTheme.bodyLarge?.color ??
                    AppColors.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: bodyLargeFontSize,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(
              FontAwesomeIcons.arrowRight,
              size: 14,
              color: AppColors.accent,
            ),
          ),
        ),
      ),
    );
  }
}
