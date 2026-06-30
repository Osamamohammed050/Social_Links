import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/colors.dart';
import '../core/responsive_helper.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizing
    final avatarSize = ResponsiveHelper.getAvatarSize(screenWidth);
    final outerSize = avatarSize + 10;
    final imageSize = avatarSize - 20;

    return Animate(
      effects: [
        FadeEffect(duration: 800.ms),
        ScaleEffect(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1.0, 1.0),
          curve: Curves.easeOut,
          duration: 800.ms,
        ),
      ],
      child: Container(
        width: avatarSize,
        height: avatarSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xFF2563EB), Color(0xFF2563EB), Color(0xFF3B82F6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.accent.withOpacity(0.28),
              blurRadius: 20,
              spreadRadius: 0,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Center(
          child: Container(
            width: outerSize,
            height: outerSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(
                color: Theme.of(context).dividerColor.withOpacity(0.12),
                width: 2,
              ),
            ),
            child: Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/Badla.jpg',
                  fit: BoxFit.cover,
                  width: imageSize,
                  height: imageSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
