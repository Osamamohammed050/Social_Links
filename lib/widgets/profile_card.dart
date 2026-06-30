import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/colors.dart';
import '../core/constants.dart';
import '../core/responsive_helper.dart';
import '../core/responsive_typography.dart';
import '../widgets/profile_avatar.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive values
    final padding = ResponsiveHelper.getSectionPadding(screenWidth);
    final verticalSpacing = ResponsiveHelper.getVerticalSpacing(screenWidth);
    final borderRadius = ResponsiveHelper.getResponsiveBorderRadius(
      screenWidth,
    );

    return Animate(
      effects: [
        FadeEffect(duration: 900.ms),
        MoveEffect(begin: const Offset(0, 24), duration: 900.ms),
      ],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.72),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: Theme.of(context).dividerColor.withOpacity(0.6),
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.25),
                  blurRadius: 30,
                  offset: const Offset(0, 18),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ProfileAvatar(),
                SizedBox(height: verticalSpacing + 6),
                Text(
                  AppConstants.appTitle,
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontSize: ResponsiveTypography.getDisplayLargeFontSize(
                      screenWidth,
                    ),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: verticalSpacing / 2),
                Text(
                  AppConstants.subtitle,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: AppColors.accent,
                    fontSize: ResponsiveTypography.getTitleLargeFontSize(
                      screenWidth,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: verticalSpacing),
                Text(
                  AppConstants.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: ResponsiveTypography.getBodyMediumFontSize(
                      screenWidth,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
