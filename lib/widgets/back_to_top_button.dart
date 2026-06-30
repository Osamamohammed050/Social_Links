import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/colors.dart';

class BackToTopButton extends StatelessWidget {
  const BackToTopButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(duration: 600.ms),
        MoveEffect(begin: const Offset(0, 24), duration: 600.ms),
      ],
      child: FloatingActionButton(
        onPressed: onTap,
        backgroundColor: AppColors.accent,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
