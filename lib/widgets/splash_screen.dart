import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Animate(
          effects: [
            FadeEffect(duration: 1200.ms),
            ScaleEffect(
              begin: const Offset(0.92, 0.92),
              end: const Offset(1, 1),
              duration: 1200.ms,
            ),
          ],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.accent,
                      AppColors.accent.withOpacity(0.65),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent.withOpacity(0.25),
                      blurRadius: 28,
                      offset: const Offset(0, 18),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.flutter_dash,
                  size: 56,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Loading portfolio',
                style: TextStyle(
                  color:
                      Theme.of(context).textTheme.bodyLarge?.color ??
                      Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 18),
              CircularProgressIndicator(color: AppColors.accent),
            ],
          ),
        ),
      ),
    );
  }
}
