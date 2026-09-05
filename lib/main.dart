import 'package:flutter/material.dart';

import 'common/theme/app_theme.dart';
import 'screens/design_system_home_screen.dart';

void main() {
  runApp(const DuoHeartApp());
}

class DuoHeartApp extends StatelessWidget {
  const DuoHeartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DuoHeart Design System',
      theme: AppTheme.theme,
      home: const DesignSystemHomeScreen(),
    );
  }
}
