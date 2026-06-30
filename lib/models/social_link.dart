import 'package:flutter/material.dart';

class SocialLink {
  const SocialLink({
    required this.title,
    required this.icon,
    required this.url,
    required this.color,
  });

  final String title;
  final IconData icon;
  final String url;
  final Color color;
}
