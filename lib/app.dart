import 'package:flutter/material.dart';

import 'core/preferences.dart';
import 'core/theme.dart';
import 'pages/contact_page.dart';
import 'pages/home_page.dart';
import 'widgets/splash_screen.dart';

class NoScrollbarBehavior extends MaterialScrollBehavior {
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final saved = await ThemePreferences.loadThemeMode();
    if (!mounted) return;
    setState(() {
      _themeMode = switch (saved) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.dark,
      };
      _ready = true;
    });
  }

  void _toggleTheme() {
    final nextMode = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    setState(() => _themeMode = nextMode);
    ThemePreferences.saveThemeMode(
      nextMode == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Osama Mohammed',
      debugShowCheckedModeBanner: false,
      scrollBehavior: NoScrollbarBehavior(),
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _themeMode,
      home: _ready
          ? HomePage(themeMode: _themeMode, onToggleTheme: _toggleTheme)
          : const SplashScreen(),
      routes: {
        '/contact': (context) =>
            ContactPage(themeMode: _themeMode, onToggleTheme: _toggleTheme),
      },
    );
  }
}
