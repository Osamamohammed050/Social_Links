import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import '../core/urls.dart';
import '../models/social_link.dart';

IconData _toIconData(FaIconData icon) => IconData(
      icon.codePoint,
      fontFamily: icon.fontFamily,
      fontPackage: icon.fontPackage,
    );

final socialLinks = <SocialLink>[
  SocialLink(
    title: 'GitHub',
    icon: _toIconData(FontAwesomeIcons.github),
    url: AppUrls.github,
    color: Color(0xFF94A3B8),
  ),
  SocialLink(
    title: 'LinkedIn',
    icon: _toIconData(FontAwesomeIcons.linkedin),
    url: AppUrls.linkedin,
    color: Color(0xFF0EA5E9),
  ),
  SocialLink(
    title: 'Facebook',
    icon: _toIconData(FontAwesomeIcons.facebook),
    url: AppUrls.facebook,
    color: Color(0xFF3B82F6),
  ),
  SocialLink(
    title: 'Instagram',
    icon: _toIconData(FontAwesomeIcons.instagram),
    url: AppUrls.instagram,
    color: Color(0xFFF97316),
  ),
  SocialLink(
    title: 'Threads',
    icon: _toIconData(FontAwesomeIcons.threads),
    url: AppUrls.threads,
    color: Color(0xFFFF0000),
  ),
  SocialLink(
    title: 'Twitter',
    icon: _toIconData(FontAwesomeIcons.x),
    url: AppUrls.twitter,
    color: Color(0xFF1DA1F2),
  ),
  SocialLink(
    title: 'TikTok',
    icon: _toIconData(FontAwesomeIcons.tiktok),
    url: AppUrls.tiktok,
    color: Color(0xFF000000),
  ),
  SocialLink(
    title: 'Telegram',
    icon: _toIconData(FontAwesomeIcons.telegram),
    url: AppUrls.telegram,
    color: Color(0xFF22C55E),
  ),
  SocialLink(
    title: 'WhatsApp',
    icon: _toIconData(FontAwesomeIcons.whatsapp),
    url: AppUrls.whatsapp,
    color: Color(0xFF10B981),
  ),
  SocialLink(
    title: 'Discord',
    icon: _toIconData(FontAwesomeIcons.discord),
    url: AppUrls.discord,
    color: Color(0xFF5865F2),
  ),
  SocialLink(
    title: 'Snapchat',
    icon: _toIconData(FontAwesomeIcons.snapchat),
    url: AppUrls.snapchat,
    color: Color(0xFFFFFC00),
  ),
  SocialLink(
    title: 'InstaPay',
    icon: _toIconData(FontAwesomeIcons.paypal),
    url: AppUrls.instaPay,
    color: Color(0xFF00AFF0),
  ),
  SocialLink(
    title: 'Email',
    icon: _toIconData(FontAwesomeIcons.google),
    url: AppUrls.email,
    color: Color(0xFFEF4444),
  ),
  SocialLink(
    title: 'Saraha',
    icon: _toIconData(FontAwesomeIcons.commentDots),
    url: AppUrls.saraha,
    color: Color(0xFF8B5CF6),
  ),
];
