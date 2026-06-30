import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/contact_item.dart';

const contactItems = <ContactItem>[
  ContactItem(
    label: 'Phone 1',
    value: '+20 112 351 1467',
    url: 'tel:+201123511467',
    icon: FontAwesomeIcons.phoneFlip,
    color: Color(0xFF22C55E),
  ),
  ContactItem(
    label: 'Phone 2',
    value: '+20 1038552066',
    url: 'tel:+201038552066',
    icon: FontAwesomeIcons.phoneFlip,
    color: Color(0xFF22C55E),
  ),
  ContactItem(
    label: 'Email',
    value: 'ous17102006@gmail.com',
    url: 'mailto:ous17102006@gmail.com',
    icon: FontAwesomeIcons.envelope,
    color: Color(0xFFEF4444),
  ),
  ContactItem(
    label: 'WhatsApp',
    value: '+20 112 351 1467',
    url: 'https://wa.me/201123511467',
    icon: FontAwesomeIcons.whatsapp,
    color: Color(0xFF10B981),
  ),
  ContactItem(
    label: 'Telegram',
    value: '@ousa0217',
    url: 'https://t.me/ousa0217',
    icon: FontAwesomeIcons.telegram,
    color: Color(0xFF22C55E),
  ),
  ContactItem(
    label: 'Facebook',
    value: 'facebook.com/share/1aZMJRceJY',
    url: 'https://www.facebook.com/share/1aZMJRceJY/',
    icon: FontAwesomeIcons.facebook,
    color: Color(0xFF1877F2),
  ),
  ContactItem(
    label: 'Instagram',
    value: '@ousa.0217',
    url: 'https://www.instagram.com/ousa.0217/',
    icon: FontAwesomeIcons.instagram,
    color: Color(0xFFF97316),
  ),
  ContactItem(
    label: 'LinkedIn',
    value: 'linkedin.com/in/ousa0217',
    url: 'https://www.linkedin.com/in/ousa0217',
    icon: FontAwesomeIcons.linkedin,
    color: Color(0xFF0EA5E9),
  ),
  ContactItem(
    label: 'GitHub',
    value: 'github.com/Osamamohammed050',
    url: 'https://github.com/Osamamohammed050',
    icon: FontAwesomeIcons.github,
    color: Color(0xFF181717),
  ),
];
