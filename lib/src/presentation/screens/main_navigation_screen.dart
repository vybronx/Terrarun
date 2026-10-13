import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'leaderboards_screen.dart';
import 'map_screen.dart';
import 'profile_screen.dart';
import 'rivals_screen.dart';

/// App layout shell with 5 equally aligned icon-only bottom navigation destinations:
/// 1. Map (Default initial screen)
/// 2. Rivals
/// 3. Home
/// 4. Leaderboards
/// 5. Profile
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  // Index 0: Map (default launch screen), 1: Rivals, 2: Home, 3: Leaderboards, 4: Profile
  int _currentIndex = 0;

  static const List<Widget> _screens = [
    MapScreen(),
    RivalsScreen(),
    HomeScreen(),
    LeaderboardsScreen(),
    ProfileScreen(),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onDestinationSelected,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Map',
            tooltip: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events_outlined),
            selectedIcon: Icon(Icons.emoji_events),
            label: 'Rivals',
            tooltip: 'Rivals',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.leaderboard_outlined),
            selectedIcon: Icon(Icons.leaderboard),
            label: 'Leaderboards',
            tooltip: 'Leaderboards',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
      ),
    );
  }
}
