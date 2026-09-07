import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/contact_item.dart';

IconData _iconData(FaIconData icon) => IconData(
      icon.codePoint,
      fontFamily: icon.fontFamily,
      fontPackage: icon.fontPackage,
    );

List<ContactItem> contactItems = <ContactItem>[
  ContactItem(
    label: 'Phone 1',
    value: '+20 11 235 114 67',
    url: 'tel:+201123511467',
    icon: _iconData(FontAwesomeIcons.phone),
    color: Color(0xFF22C55E),
  ),
  ContactItem(
    label: 'Phone 2',
    value: '+20 10 38 55 2066',
    url: 'tel:+201038552066',
    icon: _iconData(FontAwesomeIcons.phone),
    color: Color(0xFF22C55E),
  ),
  ContactItem(
    label: 'Email',
    value: 'ous17102006@gmail.com',
    url: 'mailto:ous17102006@gmail.com',
    icon: _iconData(FontAwesomeIcons.envelope),
    color: Color(0xFFEF4444),
  ),
  ContactItem(
    label: 'WhatsApp',
    value: '+20 11 235 114 67 || @Ous.0',
    url: 'https://wa.me/201123511467',
    icon: _iconData(FontAwesomeIcons.whatsapp),
    color: Color(0xFF10B981),
  ),
  ContactItem(
    label: 'Telegram',
    value: '@ousa0217',
    url: 'https://t.me/ousa0217',
    icon: _iconData(FontAwesomeIcons.telegram),
    color: Color(0xFF22C55E),
  ),
  ContactItem(
    label: 'Facebook',
    value: 'Osama Mohammed',
    url: 'https://www.facebook.com/share/19D7BWbmYh/',
    icon: _iconData(FontAwesomeIcons.facebook),
    color: Color(0xFF1877F2),
  ),
  ContactItem(
    label: 'Instagram',
    value: '@0sama.0us',
    url: 'https://www.instagram.com/0sama.0us/',
    icon: _iconData(FontAwesomeIcons.instagram),
    color: Color(0xFFF97316),
  ),
  ContactItem(
    label: 'LinkedIn',
    value: 'linkedin.com/in/0sama.0us',
    url: 'https://www.linkedin.com/in/0sama.0us/',
    icon: _iconData(FontAwesomeIcons.linkedin),
    color: Color(0xFF0EA5E9),
  ),
  ContactItem(
    label: 'GitHub',
    value: 'github.com/Osamamohammed050',
    url: 'https://github.com/Osamamohammed050',
    icon: _iconData(FontAwesomeIcons.github),
    color: Color(0xFF181717),
  ),
];
