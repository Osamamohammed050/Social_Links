import 'package:flutter/material.dart';

import '../core/colors.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _motionValue(double phase) {
    final value = (_controller.value + phase) % 1.0;
    final double mapped = value < 0.5 ? value * 2.0 : 2.0 - value * 2.0;
    return Curves.easeInOut.transform(mapped);
  }

  Widget _animatedCircle({
    required double size,
    required Alignment alignment,
    required Color color,
    required double phase,
  }) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final motion = _motionValue(phase);
        return Align(
          alignment: alignment,
          child: Transform.translate(
            offset: Offset(-16 * motion, 12 * motion),
            child: child,
          ),
        );
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color.withOpacity(0.28), color.withOpacity(0.05)],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _animatedCircle(
          size: 240,
          alignment: Alignment.topLeft,
          color: AppColors.accent,
          phase: 0.0,
        ),
        _animatedCircle(
          size: 180,
          alignment: Alignment.bottomRight,
          color: const Color(0xFF6366F1),
          phase: 0.15,
        ),
        _animatedCircle(
          size: 110,
          alignment: Alignment.centerRight,
          color: const Color(0xFF0EA5E9),
          phase: 0.32,
        ),
        _animatedCircle(
          size: 90,
          alignment: Alignment.topRight,
          color: const Color(0xFF14B8A6),
          phase: 0.55,
        ),
      ],
    );
  }
}
