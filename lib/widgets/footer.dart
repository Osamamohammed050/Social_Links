import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/constants.dart';
import '../core/responsive_typography.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bodyMediumFontSize = ResponsiveTypography.getBodyMediumFontSize(
      screenWidth,
    );

    return Animate(
      effects: [
        FadeEffect(duration: 800.ms),
        MoveEffect(begin: const Offset(0, 24), duration: 800.ms),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          AppConstants.footerText,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: bodyMediumFontSize),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
