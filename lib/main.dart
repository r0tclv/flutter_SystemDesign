import 'package:flutter/material.dart';

import 'common/theme/app_theme.dart';
import 'screens/design_system_home_screen.dart';

void main() {
  runApp(const DuoHeartApp());
}

class DuoHeartApp extends StatefulWidget {
  const DuoHeartApp({super.key});

  @override
  State<DuoHeartApp> createState() => _DuoHeartAppState();
}

class _DuoHeartAppState extends State<DuoHeartApp> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DuoHeart Design System',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      home: DesignSystemHomeScreen(
        isDarkMode: themeMode == ThemeMode.dark,
        onThemeChanged: (isDark) => setState(
          () => themeMode = isDark ? ThemeMode.dark : ThemeMode.light,
        ),
      ),
    );
  }
}
