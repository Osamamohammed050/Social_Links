import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../core/responsive_helper.dart';
import '../core/responsive_typography.dart';
import '../models/contact_item.dart';
import '../core/colors.dart';

class ContactInfoCard extends StatefulWidget {
  const ContactInfoCard({super.key, required this.item});

  final ContactItem item;

  @override
  State<ContactInfoCard> createState() => _ContactInfoCardState();
}

class _ContactInfoCardState extends State<ContactInfoCard> {
  bool _hovering = false;

  Future<void> _openLink() async {
    final url = widget.item.url;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _copyValue() async {
    await Clipboard.setData(ClipboardData(text: widget.item.value));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.item.label} copied to clipboard')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final borderRadius = ResponsiveHelper.getResponsiveBorderRadius(
      screenWidth,
    );
    final padding = ResponsiveHelper.getSectionPadding(screenWidth);
    final bodyLargeFontSize = ResponsiveTypography.getBodyLargeFontSize(
      screenWidth,
    );
    final bodyMediumFontSize = ResponsiveTypography.getBodyMediumFontSize(
      screenWidth,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: Animate(
        effects: [
          FadeEffect(duration: 500.ms),
          MoveEffect(begin: const Offset(0, 16), duration: 500.ms),
        ],
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()..scale(_hovering ? 1.01 : 1.0),
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: widget.item.color.withOpacity(0.24)),
            color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                color: widget.item.color.withOpacity(_hovering ? 0.18 : 0.08),
                blurRadius: _hovering ? 24 : 14,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: isMobile
              ? _buildMobileLayout(
                  screenWidth,
                  bodyLargeFontSize,
                  bodyMediumFontSize,
                )
              : _buildDesktopLayout(
                  screenWidth,
                  bodyLargeFontSize,
                  bodyMediumFontSize,
                ),
        ),
      ),
    );
  }

  /// Mobile layout: stacked vertically
  Widget _buildMobileLayout(
    double screenWidth,
    double bodyLargeFontSize,
    double bodyMediumFontSize,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.item.color.withOpacity(0.12),
              ),
              child: Icon(widget.item.icon, color: widget.item.color, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.label,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: bodyLargeFontSize,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.item.value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: bodyMediumFontSize,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: IconButton(
                onPressed: _copyValue,
                icon: const Icon(Icons.copy, size: 16),
                color: AppColors.textSecondary,
                tooltip: 'Copy',
                splashRadius: 20,
              ),
            ),
            Flexible(
              child: IconButton(
                onPressed: _openLink,
                icon: const Icon(Icons.open_in_new, size: 16),
                color: AppColors.accent,
                tooltip: 'Open',
                splashRadius: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Desktop layout: horizontal with icon, content, and buttons
  Widget _buildDesktopLayout(
    double screenWidth,
    double bodyLargeFontSize,
    double bodyMediumFontSize,
  ) {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.item.color.withOpacity(0.12),
          ),
          child: Icon(widget.item.icon, color: widget.item.color, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.item.label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: bodyLargeFontSize,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                widget.item.value,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: bodyMediumFontSize),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: _copyValue,
          icon: const Icon(Icons.copy, size: 18),
          color: AppColors.textSecondary,
          tooltip: 'Copy',
        ),
        const SizedBox(width: 6),
        IconButton(
          onPressed: _openLink,
          icon: const Icon(Icons.open_in_new, size: 18),
          color: AppColors.accent,
          tooltip: 'Open',
        ),
      ],
    );
  }
}
