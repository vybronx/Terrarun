import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:terrarun_app/main.dart';

void main() {
  testWidgets('TERRARUN 5-destination bottom navigation tests',
      (WidgetTester tester) async {
    // Build TERRARUN app and trigger a frame.
    await tester.pumpWidget(const TerrarunApp());

    // 1. Verify initial launch screen is Map
    expect(find.text('Territory Map'), findsOneWidget);
    expect(find.text('Interactive Grid Map'), findsOneWidget);

    // 2. Verify all 5 destination icons exist in NavigationBar and NO floating play button exists
    expect(find.widgetWithIcon(NavigationDestination, Icons.map), findsOneWidget);
    expect(find.widgetWithIcon(NavigationDestination, Icons.emoji_events_outlined), findsOneWidget);
    expect(find.widgetWithIcon(NavigationDestination, Icons.home_outlined), findsOneWidget);
    expect(find.widgetWithIcon(NavigationDestination, Icons.leaderboard_outlined), findsOneWidget);
    expect(find.widgetWithIcon(NavigationDestination, Icons.person_outlined), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsNothing);

    // 3. Verify NavigationBar labelBehavior is alwaysHide (icons-only)
    final navBar = tester.widget<NavigationBar>(find.byType(NavigationBar));
    expect(navBar.labelBehavior, NavigationDestinationLabelBehavior.alwaysHide);

    // 4. Tap Rivals icon and verify transition to RivalsScreen
    await tester.tap(find.widgetWithIcon(NavigationDestination, Icons.emoji_events_outlined));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Rivals'), findsOneWidget);
    expect(find.text('Search friends by username'), findsOneWidget);
    expect(find.text('Find Runners'), findsOneWidget);

    // Tap Add Rival button and verify SnackBar message
    final addRivalButton = find.text('Add Rival');
    expect(addRivalButton, findsOneWidget);
    await tester.tap(addRivalButton);
    await tester.pump();
    expect(
      find.text('Rival functionality for Alex_Runner will be available in a later milestone.'),
      findsOneWidget,
    );
    await tester.pumpAndSettle(); // Dismiss SnackBar

    // 5. Tap Home icon and verify transition to HomeScreen (NOT RunScreen)
    await tester.tap(find.widgetWithIcon(NavigationDestination, Icons.home_outlined));
    await tester.pumpAndSettle();
    expect(find.text('TERRARUN Dashboard'), findsOneWidget);
    expect(find.text('Territory Overview'), findsOneWidget);
    expect(find.text('GPS Run Tracking'), findsNothing);

    // 6. Tap Leaderboards icon and verify transition to LeaderboardsScreen
    await tester.tap(find.widgetWithIcon(NavigationDestination, Icons.leaderboard_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Territory Rankings'), findsOneWidget);

    // 7. Tap Profile icon and verify transition to ProfileScreen
    await tester.tap(find.widgetWithIcon(NavigationDestination, Icons.person_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Player Profile'), findsOneWidget);
    expect(find.text('Runner Profile'), findsOneWidget);
  });
}
