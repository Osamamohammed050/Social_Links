import 'package:flutter/material.dart';

class ContactItem {
  const ContactItem({
    required this.label,
    required this.value,
    required this.url,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final String url;
  final IconData icon;
  final Color color;
}
