import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // 🌟 ضفنا استيراد الحزمة هنا لفتح الـ CV

import '../core/colors.dart';
import '../core/responsive_helper.dart';
import '../core/responsive_typography.dart';
import '../data/portfolio_data.dart';
import '../data/social_links.dart';
import '../widgets/animated_background.dart';
import '../widgets/back_to_top_button.dart';
import '../widgets/contact_info_card.dart';
import '../widgets/footer.dart';
import '../widgets/profile_card.dart';
import '../widgets/social_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  double _progress = 0.0;
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.offset.clamp(0.0, maxScroll);
    setState(() {
      _progress = maxScroll > 0 ? (current / maxScroll) : 0.0;
      _showBackToTop = current > 340;
    });
  }

  Future<void> _scrollToKey(GlobalKey key) async {
    final context = key.currentContext;
    if (context == null) return;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  // 🌟 دالة فتح ملف الـ CV المخصص على الويب
  Future<void> _openCV() async {
    final Uri url = Uri.parse('assets/files/cv.pdf');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch CV');
    }
  }

  Widget _navItem(String label, VoidCallback onTap, {double fontSize = 14}) {
    final navColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? AppColors.textPrimary;
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(foregroundColor: navColor.withOpacity(0.86)),
      child: Text(label, style: TextStyle(fontSize: fontSize)),
    );
  }

  Widget _buildAppBar(double width) {
    final navItems = [
      {'label': 'Home', 'key': _homeKey},
      {'label': 'Contact', 'key': _contactKey},
    ];

    // Responsive breakpoint for showing full navigation
    final showFullNav = width >= 900;

    return AppBar(
      backgroundColor:
          Theme.of(context).appBarTheme.backgroundColor ??
          Colors.black.withOpacity(0.36),
      elevation: 0,
      centerTitle: false,
      titleSpacing: ResponsiveHelper.getHorizontalSpacing(width),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          'Osama`s Social Links',
          style: TextStyle(
            fontSize: ResponsiveTypography.getTitleLargeFontSize(width),
          ),
        ),
      ),
      actions: [
        if (showFullNav)
          ...navItems.map((item) {
            return _navItem(
              item['label'] as String,
              () => _scrollToKey(item['key'] as GlobalKey),
              fontSize: ResponsiveTypography.getBodyLargeFontSize(width),
            );
          }),
        IconButton(
          onPressed: widget.onToggleTheme,
          icon: Icon(
            widget.themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
        ),
        if (!showFullNav)
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
      ],
    );
  }

  Widget _buildDrawer() {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleFontSize = ResponsiveTypography.getTitleLargeFontSize(
      screenWidth,
    );

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.getHorizontalSpacing(screenWidth),
            vertical: ResponsiveHelper.getVerticalSpacing(screenWidth),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Menu',
                style: TextStyle(
                  fontSize: titleFontSize + 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.getVerticalSpacing(screenWidth),
              ),
              _navItem('Home', () {
                Navigator.of(context).pop();
                _scrollToKey(_homeKey);
              }),
              _navItem('Contact', () {
                Navigator.of(context).pop();
                _scrollToKey(_contactKey);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(double width) {
    final sectionPadding = ResponsiveHelper.getSectionPadding(width);
    final borderRadius = ResponsiveHelper.getResponsiveBorderRadius(width);
    final sectionSpacing = ResponsiveHelper.getSectionSpacing(width);
    final wrapSpacing = ResponsiveHelper.getWrapSpacing(width);
    final wrapRunSpacing = ResponsiveHelper.getWrapRunSpacing(width);
    final titleFontSize = ResponsiveTypography.getTitleLargeFontSize(width);

    return Container(
      key: _homeKey,
      padding: sectionPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.78),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.76),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ProfileCard(),
          SizedBox(height: sectionSpacing),
          
          // 🌟 إضافة زرار تحميل الـ CV بشكل الـ Stadium الماتش مع تصميمك
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 280), // عرض متناسق للزرار
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent, // واخد نفس لون الأكسنت الأصفر بتاعك
                  foregroundColor: Colors.black, // نص أسود واضح
                  shape: const StadiumBorder(), // شكل استاديوم دائري احترافي
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  elevation: 2,
                ),
                onPressed: _openCV,
                icon: const Icon(Icons.download_rounded, color: Colors.black),
                label: const Text(
                  'Download My CV',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: sectionSpacing),

          Text(
            'Social Links',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: titleFontSize,
            ),
          ),
          SizedBox(height: ResponsiveHelper.getVerticalSpacing(width)),
          Wrap(
            spacing: wrapSpacing,
            runSpacing: wrapRunSpacing,
            children: socialLinks
                .map((link) => SocialButton(link: link))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(double width) {
    final sectionPadding = ResponsiveHelper.getSectionPadding(width);
    final borderRadius = ResponsiveHelper.getResponsiveBorderRadius(width);
    final sectionSpacing = ResponsiveHelper.getSectionSpacing(width);
    final displayFontSize = ResponsiveTypography.getDisplayMediumFontSize(
      width,
    );
    final bodyLargeFontSize = ResponsiveTypography.getBodyLargeFontSize(width);
    final wrapSpacing = ResponsiveHelper.getWrapSpacing(width);
    final wrapRunSpacing = ResponsiveHelper.getWrapRunSpacing(width);
    final isMobile = ResponsiveHelper.isMobile(width);
    final isTablet = ResponsiveHelper.isTablet(width);

    return Container(
      width: double.infinity,
      padding: sectionPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.82),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.78),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me:',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: displayFontSize,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: ResponsiveHelper.getVerticalSpacing(width)),
          Text(
            'Get in touch with phone, email, WhatsApp, Telegram, Facebook, Instagram, LinkedIn, or GitHub. Every item is click-to-open and copyable.',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: bodyLargeFontSize),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: sectionSpacing),
          Wrap(
            spacing: wrapSpacing,
            runSpacing: wrapRunSpacing,
            children: contactItems.map((item) {
              // Responsive card width
              final cardWidth = isMobile
                  ? width - (sectionPadding.horizontal + 32)
                  : isTablet
                  ? (width - (sectionPadding.horizontal + 32)) / 2 -
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final contentPadding = ResponsiveHelper.getResponsivePadding(width);
    final sectionSpacing = ResponsiveHelper.getSectionSpacing(width);
    final maxWidth = ResponsiveHelper.getContainerMaxWidth(width);
    final appBarHeight = ResponsiveHelper.getAppBarHeight(width);

    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: width < 900 ? _buildDrawer() : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight + 8),
        child: _buildAppBar(width),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: AnimatedBackground()),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 8),
              LinearProgressIndicator(
                value: _progress,
                color: AppColors.accent,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.surface.withOpacity(0.2),
                minHeight: 3,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: contentPadding.copyWith(top: contentPadding.top + 8),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildHeroSection(width),
                          SizedBox(height: sectionSpacing),
                          Container(
                            key: _contactKey,
                            child: _buildContactSection(width),
                          ),
                          SizedBox(height: sectionSpacing),
                          const Footer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_showBackToTop)
            Positioned(
              right: ResponsiveHelper.getHorizontalSpacing(width) + 8,
              bottom: ResponsiveHelper.getVerticalSpacing(width) + 8,
              child: BackToTopButton(onTap: _scrollToTop),
            ),
        ],
      ),
    );
  }
}