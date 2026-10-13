import 'package:flutter/material.dart';

import 'src/presentation/screens/main_navigation_screen.dart';
import 'src/theme/app_theme.dart';

void main() {
  runApp(const TerrarunApp());
}

/// TERRARUN Application Root Widget.
class TerrarunApp extends StatelessWidget {
  const TerrarunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TERRARUN',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const MainNavigationScreen(),
    );
  }
}
