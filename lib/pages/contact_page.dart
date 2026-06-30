import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/responsive_helper.dart';
import '../core/responsive_typography.dart';
import '../data/portfolio_data.dart';
import '../widgets/contact_info_card.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key, this.onToggleTheme, required this.themeMode});

  final VoidCallback? onToggleTheme;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentPadding = ResponsiveHelper.getResponsivePadding(screenWidth);
    final sectionPadding = ResponsiveHelper.getSectionPadding(screenWidth);
    final sectionSpacing = ResponsiveHelper.getSectionSpacing(screenWidth);
    final borderRadius = ResponsiveHelper.getResponsiveBorderRadius(
      screenWidth,
    );
    final wrapSpacing = ResponsiveHelper.getWrapSpacing(screenWidth);
    final wrapRunSpacing = ResponsiveHelper.getWrapRunSpacing(screenWidth);
    final displayFontSize = ResponsiveTypography.getDisplayLargeFontSize(
      screenWidth,
    );
    final bodyLargeFontSize = ResponsiveTypography.getBodyLargeFontSize(
      screenWidth,
    );
    final titleLargeFontSize = ResponsiveTypography.getTitleLargeFontSize(
      screenWidth,
    );
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isTablet = ResponsiveHelper.isTablet(screenWidth);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Contact',
            style: TextStyle(fontSize: titleLargeFontSize),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: onToggleTheme,
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: contentPadding,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ResponsiveHelper.getContainerMaxWidth(screenWidth),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                      'Get in touch',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: displayFontSize,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                    .animate()
                    .fade(duration: 700.ms)
                    .move(begin: const Offset(0, 30), duration: 700.ms),
                SizedBox(
                  height: ResponsiveHelper.getVerticalSpacing(screenWidth),
                ),
                Text(
                  'A dedicated contact page with all your communication channels and a modern contact card.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontSize: bodyLargeFontSize),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: sectionSpacing),
                Wrap(
                  spacing: wrapSpacing,
                  runSpacing: wrapRunSpacing,
                  children: contactItems.map((item) {
                    // Responsive card sizing
                    final cardWidth = isMobile
                        ? screenWidth - (contentPadding.horizontal + 8)
                        : isTablet
                        ? (screenWidth - (contentPadding.horizontal + 8)) / 2 -
                              (wrapSpacing / 2)
                        : null;

                    if (cardWidth != null) {
                      return SizedBox(
                        width: cardWidth,
                        child: ContactInfoCard(item: item),
                      );
                    }
                    return ContactInfoCard(item: item);
                  }).toList(),
                ),
                SizedBox(height: sectionSpacing),
                Animate(
                  effects: [
                    FadeEffect(duration: 700.ms),
                    MoveEffect(begin: const Offset(0, 24), duration: 700.ms),
                  ],
                  child: Container(
                    padding: sectionPadding,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.surface.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(borderRadius),
                      border: Border.all(
                        color: Theme.of(context).dividerColor.withOpacity(0.8),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact card',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: titleLargeFontSize,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: ResponsiveHelper.getVerticalSpacing(
                            screenWidth,
                          ),
                        ),
                        Text(
                          'Reach out via phone, email, WhatsApp, Telegram, or social links. I respond quickly and enjoy discussing Flutter products and growth.',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontSize: bodyLargeFontSize),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: sectionSpacing / 2),
                        Wrap(
                          spacing: wrapSpacing / 2,
                          runSpacing: wrapRunSpacing / 2,
                          children: contactItems
                              .take(4)
                              .map(
                                (item) => Chip(
                                  label: Text(
                                    item.label,
                                    style: TextStyle(
                                      fontSize:
                                          ResponsiveTypography.getBodySmallFontSize(
                                            screenWidth,
                                          ),
                                    ),
                                  ),
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.surface.withOpacity(0.8),
                                  side: BorderSide(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: sectionSpacing),
                        Container(
                          height: isMobile
                              ? 180
                              : isTablet
                              ? 220
                              : 260,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(
                              ResponsiveHelper.getResponsiveBorderRadius(
                                screenWidth,
                              ),
                            ),
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Google Maps preview coming soon',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.color,
                                    fontSize: bodyLargeFontSize,
                                  ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: sectionSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
